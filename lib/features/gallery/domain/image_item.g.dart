// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageItemImpl _$$ImageItemImplFromJson(Map<String, dynamic> json) =>
    _$ImageItemImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      imageData: json['imageData'] as String,
      authorId: json['authorId'] as String,
      authorName: json['authorName'] as String,
      createdAt: _dateTimeFromJson(json['createdAt']),
    );

Map<String, dynamic> _$$ImageItemImplToJson(_$ImageItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageData': instance.imageData,
      'authorId': instance.authorId,
      'authorName': instance.authorName,
      'createdAt': _dateTimeToJson(instance.createdAt),
    };
