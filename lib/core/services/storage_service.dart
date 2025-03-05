import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _storage;

  StorageService(this._storage);

  Future<String?> uploadImage(Uint8List imageBytes, String fileName) async {
    try {
      final ref = _storage.ref().child('gallery_images').child('$fileName.png');
      
      final uploadTask = await ref.putData(
        imageBytes,
        SettableMetadata(contentType: 'image/png'),
      );

      if (uploadTask.state == TaskState.success) {
        final downloadUrl = await ref.getDownloadURL();
        return downloadUrl;
      }
      
      return null;
    } on FirebaseException catch (e) {
      print('Firebase Storage Error: ${e.code} - ${e.message}');
      return null;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }
} 