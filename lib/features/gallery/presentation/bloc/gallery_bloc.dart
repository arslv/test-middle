import 'dart:async';
import 'dart:typed_data';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/gallery_repository.dart';
import '../../domain/image_item.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';
part 'gallery_bloc.freezed.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final GalleryRepository _repository;
  StreamSubscription<List<ImageItem>>? _gallerySubscription;

  GalleryBloc(this._repository) : super(const GalleryState.initial()) {
    on<GalleryEvent>((event, emit) async {
      await event.map(
        initialized: (e) => _onInitialized(e, emit),
        imagesReceived: (e) => _onImagesReceived(e, emit),
        imageUploadRequested: (e) => _onImageUploadRequested(e, emit),
      );
    });
  }

  Future<void> _onInitialized(_Initialized event, Emitter<GalleryState> emit) async {
    emit(const GalleryState.loading());
    
    try {
      await _repository.ensureCollectionExists();
      
      await _gallerySubscription?.cancel();
      _gallerySubscription = _repository.watchImages().listen(
        (images) => add(GalleryEvent.imagesReceived(images)),
        onError: (error) {
          emit(GalleryState.loadFailure('Ошибка подключения: $error'));
        }
      );
    } catch (e) {
      emit(GalleryState.loadFailure('Ошибка подключения: $e'));
    }
  }

  Future<void> _onImagesReceived(_ImagesReceived event, Emitter<GalleryState> emit) async {
    emit(GalleryState.loadSuccess(event.images));
  }

  Future<void> _onImageUploadRequested(
    _ImageUploadRequested event,
    Emitter<GalleryState> emit,
  ) async {
    emit(const GalleryState.uploading());

    final (success, error) = await _repository.addImage(
      name: event.name,
      imageBytes: event.imageBytes,
      authorId: event.authorId,
      authorName: event.authorName,
    );

    if (success) {
      emit(const GalleryState.uploadSuccess());
    } else {
      emit(GalleryState.uploadFailure(error ?? 'Unknown error'));
    }
  }

  @override
  Future<void> close() async {
    await _gallerySubscription?.cancel();
    return super.close();
  }
} 