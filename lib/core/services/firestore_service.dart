import 'package:cloud_firestore/cloud_firestore.dart';
import '../errors/firebase_error_handler.dart';

class FirestoreService {
  final FirebaseFirestore _firestore;

  FirestoreService(this._firestore);

  Future<(bool, String?)> createDocument({
    required String collection,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    try {
      final collectionRef = _firestore.collection(collection);
      if (documentId != null) {
        await collectionRef.doc(documentId).set(data);
      } else {
        await collectionRef.add(data);
      }
      return (true, null);
    } on FirebaseException catch (e) {
      return (false, FirebaseErrorHandler.handleFirestoreError(e.code));
    } catch (e) {
      return (false, 'Произошла неизвестная ошибка');
    }
  }

  Future<(DocumentSnapshot?, String?)> getDocument({
    required String collection,
    required String documentId,
  }) async {
    try {
      final doc = await _firestore.collection(collection).doc(documentId).get();
      return (doc, null);
    } on FirebaseException catch (e) {
      return (null, FirebaseErrorHandler.handleFirestoreError(e.code));
    } catch (e) {
      return (null, 'Произошла неизвестная ошибка');
    }
  }

  Stream<QuerySnapshot> streamCollection(String collection) {
    return _firestore.collection(collection).snapshots();
  }

  Future<(QuerySnapshot?, String?)> getCollection(String collection) async {
    try {
      final snapshot = await _firestore.collection(collection).get();
      return (snapshot, null);
    } on FirebaseException catch (e) {
      return (null, FirebaseErrorHandler.handleFirestoreError(e.code));
    } catch (e) {
      return (null, 'Произошла неизвестная ошибка');
    }
  }
} 