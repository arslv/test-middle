import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/services/firestore_service.dart';
import '../../../core/services/image_service.dart';
import '../domain/image_item.dart';

class GalleryRepository {
  final FirestoreService _firestoreService;
  final ImageService _imageService;
  static const String collectionName = 'gallery_images';

  GalleryRepository(this._firestoreService, this._imageService);

  Future<void> ensureCollectionExists() async {
    try {
      final (snapshot, error) = await _firestoreService.getCollection(collectionName);
      
      if (error != null && error.contains('not-found')) {
        await _firestoreService.createDocument(
          collection: collectionName,
          data: {
            'name': 'Initial Image',
            'imageData': '',
            'authorId': 'system',
            'authorName': 'System',
            'createdAt': FieldValue.serverTimestamp(),
          },
        );
      }
    } catch (e) {
      // Игнорируем ошибки при проверке коллекции
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
      final compressedImage = await _imageService.compressImage(imageBytes);
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

  Future<(bool, String?)> updateImage({
    required String id,
    required String name,
    required Uint8List imageBytes,
    required String authorId,
    required String authorName,
  }) async {
    try {
      // Сжимаем изображение и конвертируем в base64
      final compressedImage = await _imageService.compressImage(imageBytes);
      return await _firestoreService.updateDocument(
        collection: collectionName,
        documentId: id,
        data: {
          'name': name,
          'imageData': compressedImage,
          'authorId': authorId,
          'authorName': authorName,
          'updatedAt': Timestamp.fromDate(DateTime.now()),
        },
      );
    } catch (e) {
      return (false, e.toString());
    }
  }

  Stream<List<ImageItem>> watchImages() {
    return _firestoreService
        .streamCollection(collectionName)
        .handleError((error) => <ImageItem>[])
        .map((snapshot) {
          final images = snapshot.docs
              .map((doc) {
                try {
                  final image = ImageItem.fromFirestore(doc);
                  return image.imageData.isEmpty ? null : image;
                } catch (e) {
                  return null;
                }
              })
              .where((item) => item != null)
              .cast<ImageItem>()
              .toList();
          
          if (images.isNotEmpty) {
            images.sort((a, b) => b.createdAt.compareTo(a.createdAt));
          }
          
          return images;
        });
  }
} 