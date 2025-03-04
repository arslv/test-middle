import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _storage;

  StorageService(this._storage);

  Future<String?> uploadImage(Uint8List imageBytes, String fileName) async {
    try {
      final ref = _storage.ref().child('gallery_images/$fileName.png');
      final uploadTask = ref.putData(
        imageBytes,
        SettableMetadata(contentType: 'image/png'),
      );
      final snapshot = await uploadTask;
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }
} 