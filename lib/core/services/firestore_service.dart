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
      return (false, 'Произошла неизвестная ошибка: ${e.toString()}');
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
      return (null, 'Произошла неизвестная ошибка: ${e.toString()}');
    }
  }

  Stream<QuerySnapshot> streamCollection(String collection) {
    try {
      return _firestore.collection(collection).snapshots();
    } catch (e) {
      // В случае ошибки возвращаем поток с ошибкой
      return Stream.error(e);
    }
  }

  Future<(QuerySnapshot?, String?)> getCollection(String collection) async {
    try {
      final snapshot = await _firestore.collection(collection).get();
      return (snapshot, null);
    } on FirebaseException catch (e) {
      return (null, FirebaseErrorHandler.handleFirestoreError(e.code));
    } catch (e) {
      return (null, 'Произошла неизвестная ошибка: ${e.toString()}');
    }
  }
  
  Future<(bool, String?)> updateDocument({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore.collection(collection).doc(documentId).update(data);
      return (true, null);
    } on FirebaseException catch (e) {
      return (false, FirebaseErrorHandler.handleFirestoreError(e.code));
    } catch (e) {
      return (false, 'Произошла неизвестная ошибка: ${e.toString()}');
    }
  }
  
  Future<(bool, String?)> deleteDocument({
    required String collection,
    required String documentId,
  }) async {
    try {
      await _firestore.collection(collection).doc(documentId).delete();
      return (true, null);
    } on FirebaseException catch (e) {
      return (false, FirebaseErrorHandler.handleFirestoreError(e.code));
    } catch (e) {
      return (false, 'Произошла неизвестная ошибка: ${e.toString()}');
    }
  }
} 