// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GalleryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(List<ImageItem> images) imagesReceived,
    required TResult Function(
            String name, String imageUrl, String authorId, String authorName)
        imageUploadRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(List<ImageItem> images)? imagesReceived,
    TResult? Function(
            String name, String imageUrl, String authorId, String authorName)?
        imageUploadRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(List<ImageItem> images)? imagesReceived,
    TResult Function(
            String name, String imageUrl, String authorId, String authorName)?
        imageUploadRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_ImagesReceived value) imagesReceived,
    required TResult Function(_ImageUploadRequested value) imageUploadRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_ImagesReceived value)? imagesReceived,
    TResult? Function(_ImageUploadRequested value)? imageUploadRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ImagesReceived value)? imagesReceived,
    TResult Function(_ImageUploadRequested value)? imageUploadRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryEventCopyWith<$Res> {
  factory $GalleryEventCopyWith(
          GalleryEvent value, $Res Function(GalleryEvent) then) =
      _$GalleryEventCopyWithImpl<$Res, GalleryEvent>;
}

/// @nodoc
class _$GalleryEventCopyWithImpl<$Res, $Val extends GalleryEvent>
    implements $GalleryEventCopyWith<$Res> {
  _$GalleryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GalleryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitializedImplCopyWith<$Res> {
  factory _$$InitializedImplCopyWith(
          _$InitializedImpl value, $Res Function(_$InitializedImpl) then) =
      __$$InitializedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$GalleryEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);

  /// Create a copy of GalleryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl();

  @override
  String toString() {
    return 'GalleryEvent.initialized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(List<ImageItem> images) imagesReceived,
    required TResult Function(
            String name, String imageUrl, String authorId, String authorName)
        imageUploadRequested,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(List<ImageItem> images)? imagesReceived,
    TResult? Function(
            String name, String imageUrl, String authorId, String authorName)?
        imageUploadRequested,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(List<ImageItem> images)? imagesReceived,
    TResult Function(
            String name, String imageUrl, String authorId, String authorName)?
        imageUploadRequested,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_ImagesReceived value) imagesReceived,
    required TResult Function(_ImageUploadRequested value) imageUploadRequested,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_ImagesReceived value)? imagesReceived,
    TResult? Function(_ImageUploadRequested value)? imageUploadRequested,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ImagesReceived value)? imagesReceived,
    TResult Function(_ImageUploadRequested value)? imageUploadRequested,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements GalleryEvent {
  const factory _Initialized() = _$InitializedImpl;
}

/// @nodoc
abstract class _$$ImagesReceivedImplCopyWith<$Res> {
  factory _$$ImagesReceivedImplCopyWith(_$ImagesReceivedImpl value,
          $Res Function(_$ImagesReceivedImpl) then) =
      __$$ImagesReceivedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ImageItem> images});
}

/// @nodoc
class __$$ImagesReceivedImplCopyWithImpl<$Res>
    extends _$GalleryEventCopyWithImpl<$Res, _$ImagesReceivedImpl>
    implements _$$ImagesReceivedImplCopyWith<$Res> {
  __$$ImagesReceivedImplCopyWithImpl(
      _$ImagesReceivedImpl _value, $Res Function(_$ImagesReceivedImpl) _then)
      : super(_value, _then);

  /// Create a copy of GalleryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
  }) {
    return _then(_$ImagesReceivedImpl(
      null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageItem>,
    ));
  }
}

/// @nodoc

class _$ImagesReceivedImpl implements _ImagesReceived {
  const _$ImagesReceivedImpl(final List<ImageItem> images) : _images = images;

  final List<ImageItem> _images;
  @override
  List<ImageItem> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'GalleryEvent.imagesReceived(images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImagesReceivedImpl &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_images));

  /// Create a copy of GalleryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImagesReceivedImplCopyWith<_$ImagesReceivedImpl> get copyWith =>
      __$$ImagesReceivedImplCopyWithImpl<_$ImagesReceivedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(List<ImageItem> images) imagesReceived,
    required TResult Function(
            String name, String imageUrl, String authorId, String authorName)
        imageUploadRequested,
  }) {
    return imagesReceived(images);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(List<ImageItem> images)? imagesReceived,
    TResult? Function(
            String name, String imageUrl, String authorId, String authorName)?
        imageUploadRequested,
  }) {
    return imagesReceived?.call(images);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(List<ImageItem> images)? imagesReceived,
    TResult Function(
            String name, String imageUrl, String authorId, String authorName)?
        imageUploadRequested,
    required TResult orElse(),
  }) {
    if (imagesReceived != null) {
      return imagesReceived(images);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_ImagesReceived value) imagesReceived,
    required TResult Function(_ImageUploadRequested value) imageUploadRequested,
  }) {
    return imagesReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_ImagesReceived value)? imagesReceived,
    TResult? Function(_ImageUploadRequested value)? imageUploadRequested,
  }) {
    return imagesReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ImagesReceived value)? imagesReceived,
    TResult Function(_ImageUploadRequested value)? imageUploadRequested,
    required TResult orElse(),
  }) {
    if (imagesReceived != null) {
      return imagesReceived(this);
    }
    return orElse();
  }
}

abstract class _ImagesReceived implements GalleryEvent {
  const factory _ImagesReceived(final List<ImageItem> images) =
      _$ImagesReceivedImpl;

  List<ImageItem> get images;

  /// Create a copy of GalleryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImagesReceivedImplCopyWith<_$ImagesReceivedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImageUploadRequestedImplCopyWith<$Res> {
  factory _$$ImageUploadRequestedImplCopyWith(_$ImageUploadRequestedImpl value,
          $Res Function(_$ImageUploadRequestedImpl) then) =
      __$$ImageUploadRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, String imageUrl, String authorId, String authorName});
}

/// @nodoc
class __$$ImageUploadRequestedImplCopyWithImpl<$Res>
    extends _$GalleryEventCopyWithImpl<$Res, _$ImageUploadRequestedImpl>
    implements _$$ImageUploadRequestedImplCopyWith<$Res> {
  __$$ImageUploadRequestedImplCopyWithImpl(_$ImageUploadRequestedImpl _value,
      $Res Function(_$ImageUploadRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of GalleryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imageUrl = null,
    Object? authorId = null,
    Object? authorName = null,
  }) {
    return _then(_$ImageUploadRequestedImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: null == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ImageUploadRequestedImpl implements _ImageUploadRequested {
  const _$ImageUploadRequestedImpl(
      {required this.name,
      required this.imageUrl,
      required this.authorId,
      required this.authorName});

  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final String authorId;
  @override
  final String authorName;

  @override
  String toString() {
    return 'GalleryEvent.imageUploadRequested(name: $name, imageUrl: $imageUrl, authorId: $authorId, authorName: $authorName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageUploadRequestedImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, imageUrl, authorId, authorName);

  /// Create a copy of GalleryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageUploadRequestedImplCopyWith<_$ImageUploadRequestedImpl>
      get copyWith =>
          __$$ImageUploadRequestedImplCopyWithImpl<_$ImageUploadRequestedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(List<ImageItem> images) imagesReceived,
    required TResult Function(
            String name, String imageUrl, String authorId, String authorName)
        imageUploadRequested,
  }) {
    return imageUploadRequested(name, imageUrl, authorId, authorName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(List<ImageItem> images)? imagesReceived,
    TResult? Function(
            String name, String imageUrl, String authorId, String authorName)?
        imageUploadRequested,
  }) {
    return imageUploadRequested?.call(name, imageUrl, authorId, authorName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(List<ImageItem> images)? imagesReceived,
    TResult Function(
            String name, String imageUrl, String authorId, String authorName)?
        imageUploadRequested,
    required TResult orElse(),
  }) {
    if (imageUploadRequested != null) {
      return imageUploadRequested(name, imageUrl, authorId, authorName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_ImagesReceived value) imagesReceived,
    required TResult Function(_ImageUploadRequested value) imageUploadRequested,
  }) {
    return imageUploadRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_ImagesReceived value)? imagesReceived,
    TResult? Function(_ImageUploadRequested value)? imageUploadRequested,
  }) {
    return imageUploadRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ImagesReceived value)? imagesReceived,
    TResult Function(_ImageUploadRequested value)? imageUploadRequested,
    required TResult orElse(),
  }) {
    if (imageUploadRequested != null) {
      return imageUploadRequested(this);
    }
    return orElse();
  }
}

abstract class _ImageUploadRequested implements GalleryEvent {
  const factory _ImageUploadRequested(
      {required final String name,
      required final String imageUrl,
      required final String authorId,
      required final String authorName}) = _$ImageUploadRequestedImpl;

  String get name;
  String get imageUrl;
  String get authorId;
  String get authorName;

  /// Create a copy of GalleryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImageUploadRequestedImplCopyWith<_$ImageUploadRequestedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GalleryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ImageItem> images) loadSuccess,
    required TResult Function() uploading,
    required TResult Function() uploadSuccess,
    required TResult Function(String message) uploadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ImageItem> images)? loadSuccess,
    TResult? Function()? uploading,
    TResult? Function()? uploadSuccess,
    TResult? Function(String message)? uploadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ImageItem> images)? loadSuccess,
    TResult Function()? uploading,
    TResult Function()? uploadSuccess,
    TResult Function(String message)? uploadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_Uploading value) uploading,
    required TResult Function(_UploadSuccess value) uploadSuccess,
    required TResult Function(_UploadFailure value) uploadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_Uploading value)? uploading,
    TResult? Function(_UploadSuccess value)? uploadSuccess,
    TResult? Function(_UploadFailure value)? uploadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_UploadSuccess value)? uploadSuccess,
    TResult Function(_UploadFailure value)? uploadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryStateCopyWith<$Res> {
  factory $GalleryStateCopyWith(
          GalleryState value, $Res Function(GalleryState) then) =
      _$GalleryStateCopyWithImpl<$Res, GalleryState>;
}

/// @nodoc
class _$GalleryStateCopyWithImpl<$Res, $Val extends GalleryState>
    implements $GalleryStateCopyWith<$Res> {
  _$GalleryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GalleryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$GalleryStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of GalleryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'GalleryState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ImageItem> images) loadSuccess,
    required TResult Function() uploading,
    required TResult Function() uploadSuccess,
    required TResult Function(String message) uploadFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ImageItem> images)? loadSuccess,
    TResult? Function()? uploading,
    TResult? Function()? uploadSuccess,
    TResult? Function(String message)? uploadFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ImageItem> images)? loadSuccess,
    TResult Function()? uploading,
    TResult Function()? uploadSuccess,
    TResult Function(String message)? uploadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_Uploading value) uploading,
    required TResult Function(_UploadSuccess value) uploadSuccess,
    required TResult Function(_UploadFailure value) uploadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_Uploading value)? uploading,
    TResult? Function(_UploadSuccess value)? uploadSuccess,
    TResult? Function(_UploadFailure value)? uploadFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_UploadSuccess value)? uploadSuccess,
    TResult Function(_UploadFailure value)? uploadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements GalleryState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$GalleryStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of GalleryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'GalleryState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ImageItem> images) loadSuccess,
    required TResult Function() uploading,
    required TResult Function() uploadSuccess,
    required TResult Function(String message) uploadFailure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ImageItem> images)? loadSuccess,
    TResult? Function()? uploading,
    TResult? Function()? uploadSuccess,
    TResult? Function(String message)? uploadFailure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ImageItem> images)? loadSuccess,
    TResult Function()? uploading,
    TResult Function()? uploadSuccess,
    TResult Function(String message)? uploadFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_Uploading value) uploading,
    required TResult Function(_UploadSuccess value) uploadSuccess,
    required TResult Function(_UploadFailure value) uploadFailure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_Uploading value)? uploading,
    TResult? Function(_UploadSuccess value)? uploadSuccess,
    TResult? Function(_UploadFailure value)? uploadFailure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_UploadSuccess value)? uploadSuccess,
    TResult Function(_UploadFailure value)? uploadFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements GalleryState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadSuccessImplCopyWith<$Res> {
  factory _$$LoadSuccessImplCopyWith(
          _$LoadSuccessImpl value, $Res Function(_$LoadSuccessImpl) then) =
      __$$LoadSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ImageItem> images});
}

/// @nodoc
class __$$LoadSuccessImplCopyWithImpl<$Res>
    extends _$GalleryStateCopyWithImpl<$Res, _$LoadSuccessImpl>
    implements _$$LoadSuccessImplCopyWith<$Res> {
  __$$LoadSuccessImplCopyWithImpl(
      _$LoadSuccessImpl _value, $Res Function(_$LoadSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of GalleryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
  }) {
    return _then(_$LoadSuccessImpl(
      null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageItem>,
    ));
  }
}

/// @nodoc

class _$LoadSuccessImpl implements _LoadSuccess {
  const _$LoadSuccessImpl(final List<ImageItem> images) : _images = images;

  final List<ImageItem> _images;
  @override
  List<ImageItem> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'GalleryState.loadSuccess(images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadSuccessImpl &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_images));

  /// Create a copy of GalleryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadSuccessImplCopyWith<_$LoadSuccessImpl> get copyWith =>
      __$$LoadSuccessImplCopyWithImpl<_$LoadSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ImageItem> images) loadSuccess,
    required TResult Function() uploading,
    required TResult Function() uploadSuccess,
    required TResult Function(String message) uploadFailure,
  }) {
    return loadSuccess(images);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ImageItem> images)? loadSuccess,
    TResult? Function()? uploading,
    TResult? Function()? uploadSuccess,
    TResult? Function(String message)? uploadFailure,
  }) {
    return loadSuccess?.call(images);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ImageItem> images)? loadSuccess,
    TResult Function()? uploading,
    TResult Function()? uploadSuccess,
    TResult Function(String message)? uploadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(images);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_Uploading value) uploading,
    required TResult Function(_UploadSuccess value) uploadSuccess,
    required TResult Function(_UploadFailure value) uploadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_Uploading value)? uploading,
    TResult? Function(_UploadSuccess value)? uploadSuccess,
    TResult? Function(_UploadFailure value)? uploadFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_UploadSuccess value)? uploadSuccess,
    TResult Function(_UploadFailure value)? uploadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess implements GalleryState {
  const factory _LoadSuccess(final List<ImageItem> images) = _$LoadSuccessImpl;

  List<ImageItem> get images;

  /// Create a copy of GalleryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadSuccessImplCopyWith<_$LoadSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UploadingImplCopyWith<$Res> {
  factory _$$UploadingImplCopyWith(
          _$UploadingImpl value, $Res Function(_$UploadingImpl) then) =
      __$$UploadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UploadingImplCopyWithImpl<$Res>
    extends _$GalleryStateCopyWithImpl<$Res, _$UploadingImpl>
    implements _$$UploadingImplCopyWith<$Res> {
  __$$UploadingImplCopyWithImpl(
      _$UploadingImpl _value, $Res Function(_$UploadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of GalleryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UploadingImpl implements _Uploading {
  const _$UploadingImpl();

  @override
  String toString() {
    return 'GalleryState.uploading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UploadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ImageItem> images) loadSuccess,
    required TResult Function() uploading,
    required TResult Function() uploadSuccess,
    required TResult Function(String message) uploadFailure,
  }) {
    return uploading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ImageItem> images)? loadSuccess,
    TResult? Function()? uploading,
    TResult? Function()? uploadSuccess,
    TResult? Function(String message)? uploadFailure,
  }) {
    return uploading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ImageItem> images)? loadSuccess,
    TResult Function()? uploading,
    TResult Function()? uploadSuccess,
    TResult Function(String message)? uploadFailure,
    required TResult orElse(),
  }) {
    if (uploading != null) {
      return uploading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_Uploading value) uploading,
    required TResult Function(_UploadSuccess value) uploadSuccess,
    required TResult Function(_UploadFailure value) uploadFailure,
  }) {
    return uploading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_Uploading value)? uploading,
    TResult? Function(_UploadSuccess value)? uploadSuccess,
    TResult? Function(_UploadFailure value)? uploadFailure,
  }) {
    return uploading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_UploadSuccess value)? uploadSuccess,
    TResult Function(_UploadFailure value)? uploadFailure,
    required TResult orElse(),
  }) {
    if (uploading != null) {
      return uploading(this);
    }
    return orElse();
  }
}

abstract class _Uploading implements GalleryState {
  const factory _Uploading() = _$UploadingImpl;
}

/// @nodoc
abstract class _$$UploadSuccessImplCopyWith<$Res> {
  factory _$$UploadSuccessImplCopyWith(
          _$UploadSuccessImpl value, $Res Function(_$UploadSuccessImpl) then) =
      __$$UploadSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UploadSuccessImplCopyWithImpl<$Res>
    extends _$GalleryStateCopyWithImpl<$Res, _$UploadSuccessImpl>
    implements _$$UploadSuccessImplCopyWith<$Res> {
  __$$UploadSuccessImplCopyWithImpl(
      _$UploadSuccessImpl _value, $Res Function(_$UploadSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of GalleryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UploadSuccessImpl implements _UploadSuccess {
  const _$UploadSuccessImpl();

  @override
  String toString() {
    return 'GalleryState.uploadSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UploadSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ImageItem> images) loadSuccess,
    required TResult Function() uploading,
    required TResult Function() uploadSuccess,
    required TResult Function(String message) uploadFailure,
  }) {
    return uploadSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ImageItem> images)? loadSuccess,
    TResult? Function()? uploading,
    TResult? Function()? uploadSuccess,
    TResult? Function(String message)? uploadFailure,
  }) {
    return uploadSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ImageItem> images)? loadSuccess,
    TResult Function()? uploading,
    TResult Function()? uploadSuccess,
    TResult Function(String message)? uploadFailure,
    required TResult orElse(),
  }) {
    if (uploadSuccess != null) {
      return uploadSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_Uploading value) uploading,
    required TResult Function(_UploadSuccess value) uploadSuccess,
    required TResult Function(_UploadFailure value) uploadFailure,
  }) {
    return uploadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_Uploading value)? uploading,
    TResult? Function(_UploadSuccess value)? uploadSuccess,
    TResult? Function(_UploadFailure value)? uploadFailure,
  }) {
    return uploadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_UploadSuccess value)? uploadSuccess,
    TResult Function(_UploadFailure value)? uploadFailure,
    required TResult orElse(),
  }) {
    if (uploadSuccess != null) {
      return uploadSuccess(this);
    }
    return orElse();
  }
}

abstract class _UploadSuccess implements GalleryState {
  const factory _UploadSuccess() = _$UploadSuccessImpl;
}

/// @nodoc
abstract class _$$UploadFailureImplCopyWith<$Res> {
  factory _$$UploadFailureImplCopyWith(
          _$UploadFailureImpl value, $Res Function(_$UploadFailureImpl) then) =
      __$$UploadFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UploadFailureImplCopyWithImpl<$Res>
    extends _$GalleryStateCopyWithImpl<$Res, _$UploadFailureImpl>
    implements _$$UploadFailureImplCopyWith<$Res> {
  __$$UploadFailureImplCopyWithImpl(
      _$UploadFailureImpl _value, $Res Function(_$UploadFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of GalleryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UploadFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UploadFailureImpl implements _UploadFailure {
  const _$UploadFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'GalleryState.uploadFailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of GalleryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadFailureImplCopyWith<_$UploadFailureImpl> get copyWith =>
      __$$UploadFailureImplCopyWithImpl<_$UploadFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ImageItem> images) loadSuccess,
    required TResult Function() uploading,
    required TResult Function() uploadSuccess,
    required TResult Function(String message) uploadFailure,
  }) {
    return uploadFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ImageItem> images)? loadSuccess,
    TResult? Function()? uploading,
    TResult? Function()? uploadSuccess,
    TResult? Function(String message)? uploadFailure,
  }) {
    return uploadFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ImageItem> images)? loadSuccess,
    TResult Function()? uploading,
    TResult Function()? uploadSuccess,
    TResult Function(String message)? uploadFailure,
    required TResult orElse(),
  }) {
    if (uploadFailure != null) {
      return uploadFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_Uploading value) uploading,
    required TResult Function(_UploadSuccess value) uploadSuccess,
    required TResult Function(_UploadFailure value) uploadFailure,
  }) {
    return uploadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_Uploading value)? uploading,
    TResult? Function(_UploadSuccess value)? uploadSuccess,
    TResult? Function(_UploadFailure value)? uploadFailure,
  }) {
    return uploadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Uploading value)? uploading,
    TResult Function(_UploadSuccess value)? uploadSuccess,
    TResult Function(_UploadFailure value)? uploadFailure,
    required TResult orElse(),
  }) {
    if (uploadFailure != null) {
      return uploadFailure(this);
    }
    return orElse();
  }
}

abstract class _UploadFailure implements GalleryState {
  const factory _UploadFailure(final String message) = _$UploadFailureImpl;

  String get message;

  /// Create a copy of GalleryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadFailureImplCopyWith<_$UploadFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
