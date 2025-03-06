import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/services/firestore_service.dart';
import '../domain/image_item.dart';

class GalleryRepository {
  final FirestoreService _firestoreService;
  static const String collectionName = 'gallery_images';

  GalleryRepository(this._firestoreService);

  // Метод для сжатия изображения
  Future<String> _compressImage(Uint8List bytes) async {
    try {
      // Декодируем изображение
      final ui.Image image = await decodeImageFromList(bytes);
      
      // Определяем максимальный размер
      const maxSize = 500.0; // px
      double width = image.width.toDouble();
      double height = image.height.toDouble();
      
      // Вычисляем новые размеры, сохраняя пропорции
      if (width > height) {
        if (width > maxSize) {
          height *= maxSize / width;
          width = maxSize;
        }
      } else {
        if (height > maxSize) {
          width *= maxSize / height;
          height = maxSize;
        }
      }

      // Создаем новый recorder для рисования
      final recorder = ui.PictureRecorder();
      final canvas = Canvas(recorder);
      
      // Рисуем изображение с новыми размерами
      canvas.drawImageRect(
        image,
        Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
        Rect.fromLTWH(0, 0, width, height),
        Paint()..filterQuality = FilterQuality.medium,
      );
      
      // Создаем новое изображение
      final ui.Image resizedImage = await recorder.endRecording().toImage(
        width.round(),
        height.round(),
      );
      
      // Получаем байты нового изображения
      final ByteData? byteData = await resizedImage.toByteData(
        format: ui.ImageByteFormat.png,
      );
      
      if (byteData == null) throw Exception('Failed to compress image');
      
      // Конвертируем в base64
      return base64Encode(byteData.buffer.asUint8List());
    } catch (e) {
      print('Error compressing image: $e');
      // Если что-то пошло не так, возвращаем оригинальное изображение в base64
      return base64Encode(bytes);
    }
  }

  Future<void> ensureCollectionExists() async {
    final (snapshot, error) = await _firestoreService.getCollection(collectionName);
    if (error != null && error.contains('not-found')) {
      // Создаем коллекцию, добавляя первый документ TODO не забыть потом удалять его
      await _firestoreService.createDocument(
        collection: collectionName,
        data: {
          'name': 'Initial Image',
          'imageUrl': 'https://placeholder.com/150',
          'authorId': 'system',
          'authorName': 'System',
          'createdAt': FieldValue.serverTimestamp(),
        },
      );
    }
  }

  Future<(bool, String?)> addImage({
    required String name,
    required Uint8List imageBytes,
    required String authorId,
    required String authorName,
  }) async {
    try {
      // Сжимаем изображение и конвертируем в base64
      final compressedImage = await _compressImage(imageBytes);
      return await _firestoreService.createDocument(
        collection: collectionName,
        data: {
          'name': name,
          'imageData': compressedImage,
          'authorId': authorId,
          'authorName': authorName,
          'createdAt': Timestamp.fromDate(DateTime.now()),
        },
      );
    } catch (e) {
      return (false, e.toString());
    }
  }

  Stream<List<ImageItem>> watchImages() {
    return _firestoreService
        .streamCollection(collectionName)
        .map((snapshot) => snapshot.docs
            .map((doc) => ImageItem.fromFirestore(doc))
            .toList()
          ..sort((a, b) => b.createdAt.compareTo(a.createdAt)));
  }
} 