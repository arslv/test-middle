part of 'gallery_bloc.dart';

@freezed
class GalleryState with _$GalleryState {
  const factory GalleryState.initial() = _Initial;
  const factory GalleryState.loading() = _Loading;
  const factory GalleryState.loadSuccess(List<ImageItem> images) = _LoadSuccess;
  const factory GalleryState.uploading() = _Uploading;
  const factory GalleryState.uploadSuccess() = _UploadSuccess;
  const factory GalleryState.uploadFailure(String message) = _UploadFailure;
} 