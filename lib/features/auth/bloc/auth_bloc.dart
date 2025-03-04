import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;

  AuthBloc(this._authService) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
        signInRequested: (e) => _onSignInRequested(e, emit),
        signUpRequested: (e) => _onSignUpRequested(e, emit),
        signOutRequested: (e) => _onSignOutRequested(e, emit),
        authCheckRequested: (e) => _onAuthCheckRequested(e, emit),
      );
    });
  }

  Future<void> _onSignInRequested(
    _SignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    
    final (userCredential, error) = await _authService.signInWithEmailAndPassword(
      email: event.email,
      password: event.password,
    );

    if (error != null) {
      emit(AuthState.failure(error));
    } else {
      emit(const AuthState.authenticated());
    }
  }

  Future<void> _onSignUpRequested(
    _SignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    
    final (userCredential, error) = 
        await _authService.createUserWithEmailAndPassword(
      email: event.email,
      password: event.password,
    );

    if (error != null) {
      emit(AuthState.failure(error));
    } else {
      emit(const AuthState.authenticated());
    }
  }

  Future<void> _onSignOutRequested(
    _SignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await _authService.signOut();
    emit(const AuthState.unauthenticated());
  }

  Future<void> _onAuthCheckRequested(
    _AuthCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    final user = _authService.currentUser;
    if (user != null) {
      emit(const AuthState.authenticated());
    } else {
      emit(const AuthState.unauthenticated());
    }
  }
} 