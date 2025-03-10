import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'image_item.freezed.dart';
part 'image_item.g.dart';

@freezed
class ImageItem with _$ImageItem {
  const factory ImageItem({
    required String id,
    required String name,
    required String imageData,
    required String authorId,
    required String authorName,
    @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
    required DateTime createdAt,
  }) = _ImageItem;

  factory ImageItem.fromJson(Map<String, dynamic> json) => _$ImageItemFromJson(json);

  factory ImageItem.fromFirestore(DocumentSnapshot doc) {
    try {
      final data = doc.data() as Map<String, dynamic>;
      
      return ImageItem(
        id: doc.id,
        name: data['name'] as String? ?? 'Без названия',
        imageData: data['imageData'] as String? ?? '',
        authorId: data['authorId'] as String? ?? 'unknown',
        authorName: data['authorName'] as String? ?? 'Неизвестный автор',
        createdAt: _dateTimeFromJson(data['createdAt']),
      );
    } catch (e) {
      print("Ошибка при создании ImageItem из документа ${doc.id}: $e");
      print("Данные документа: ${doc.data()}");
      
      return ImageItem(
        id: doc.id,
        name: 'Ошибка загрузки',
        imageData: '',
        authorId: 'error',
        authorName: 'Ошибка',
        createdAt: DateTime.now(),
      );
    }
  }
}

DateTime _dateTimeFromJson(dynamic timestamp) {
  if (timestamp is Timestamp) {
    return timestamp.toDate();
  } else if (timestamp is DateTime) {
    return timestamp;
  }
  return DateTime.now();
}

dynamic _dateTimeToJson(DateTime dateTime) {
  return Timestamp.fromDate(dateTime);
} 