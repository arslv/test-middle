import 'package:firebase_auth/firebase_auth.dart';
import '../errors/firebase_error_handler.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  User? get currentUser => _firebaseAuth.currentUser;

  Future<(UserCredential?, String?)> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      print('Attempting to sign in with email: $email');
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Sign in successful');
      return (userCredential, null);
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException: ${e.code} - ${e.message}');
      return (null, FirebaseErrorHandler.handleAuthError(e.code));
    } catch (e) {
      print('Unknown error: $e');
      return (null, 'Произошла неизвестная ошибка');
    }
  }

  Future<(UserCredential?, String?)> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return (userCredential, null);
    } on FirebaseAuthException catch (e) {
      return (null, FirebaseErrorHandler.handleAuthError(e.code));
    } catch (e) {
      return (null, 'Произошла неизвестная ошибка');
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
} 