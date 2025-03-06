import 'dart:async';
import 'dart:typed_data';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/gallery_repository.dart';
import '../../domain/image_item.dart';
import 'dart:async';
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
        imageUpdateRequested: (e) => _onImageUpdateRequested(e, emit),
      );
    });
  }

  Future<void> _onInitialized(_Initialized event, Emitter<GalleryState> emit) async {
    emit(const GalleryState.loading());
    
    try {
      await _repository.ensureCollectionExists();
      await _gallerySubscription?.cancel();
      
      final completer = Completer<List<ImageItem>>();
      
      _gallerySubscription = _repository.watchImages().listen(
        (images) {
          if (!completer.isCompleted) {
            completer.complete(images);
          }
        },
        onError: (error) {
          if (!completer.isCompleted) {
            completer.completeError(error);
          }
        },
        onDone: () {
          if (!completer.isCompleted) {
            completer.complete([]);
          }
        }
      );
      
      try {
        final images = await completer.future.timeout(
          const Duration(seconds: 5),
          onTimeout: () {
            throw TimeoutException('Превышено время ожидания');
          },
        );
        
        emit(GalleryState.loadSuccess(images));
      } on TimeoutException catch (_) {
        emit(const GalleryState.loadFailure('Превышено время ожидания'));
      } catch (e) {
        emit(GalleryState.loadFailure('Ошибка подключения: $e'));
      }
      
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

  Future<void> _onImageUpdateRequested(
    _ImageUpdateRequested event,
    Emitter<GalleryState> emit,
  ) async {
    emit(const GalleryState.uploading());
    final (success, error) = await _repository.updateImage(
      id: event.id,
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