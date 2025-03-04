import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/services/firestore_service.dart';
import '../domain/image_item.dart';

class GalleryRepository {
  final FirestoreService _firestoreService;
  static const String collectionName = 'gallery_images';

  GalleryRepository(this._firestoreService);

  Future<void> ensureCollectionExists() async {
    final (snapshot, error) = await _firestoreService.getCollection(collectionName);
    if (error != null && error.contains('not-found')) {
      // Создаем коллекцию, добавляя первый документ
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
    required String imageUrl,
    required String authorId,
    required String authorName,
  }) async {
    return await _firestoreService.createDocument(
      collection: collectionName,
      data: {
        'name': name,
        'imageUrl': imageUrl,
        'authorId': authorId,
        'authorName': authorName,
        'createdAt': FieldValue.serverTimestamp(),
      },
    );
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