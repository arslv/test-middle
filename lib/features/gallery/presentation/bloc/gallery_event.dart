part of 'gallery_bloc.dart';

@freezed
class GalleryEvent with _$GalleryEvent {
  const factory GalleryEvent.initialized() = _Initialized;
  
  const factory GalleryEvent.imagesReceived(List<ImageItem> images) = _ImagesReceived;
  
  const factory GalleryEvent.imageUploadRequested({
    required String name,
    required Uint8List imageBytes,
    required String authorId,
    required String authorName,
  }) = _ImageUploadRequested;
} 