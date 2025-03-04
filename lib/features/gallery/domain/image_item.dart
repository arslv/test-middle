import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'image_item.freezed.dart';
part 'image_item.g.dart';

@freezed
class ImageItem with _$ImageItem {
  const factory ImageItem({
    required String id,
    required String name,
    required String imageUrl,
    required String authorId,
    required String authorName,
    @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
    required DateTime createdAt,
  }) = _ImageItem;

  factory ImageItem.fromJson(Map<String, dynamic> json) => _$ImageItemFromJson(json);

  factory ImageItem.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ImageItem(
      id: doc.id,
      name: data['name'] as String,
      imageUrl: data['imageUrl'] as String,
      authorId: data['authorId'] as String,
      authorName: data['authorName'] as String,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }
}

DateTime _dateTimeFromJson(dynamic timestamp) {
  if (timestamp is Timestamp) {
    return timestamp.toDate();
  }
  return DateTime.parse(timestamp as String);
}

dynamic _dateTimeToJson(DateTime dateTime) {
  return dateTime.toIso8601String();
} 