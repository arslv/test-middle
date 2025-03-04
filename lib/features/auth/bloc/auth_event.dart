part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signInRequested({
    required String email,
    required String password,
  }) = _SignInRequested;

  const factory AuthEvent.signUpRequested({
    required String email,
    required String password,
  }) = _SignUpRequested;

  const factory AuthEvent.signOutRequested() = _SignOutRequested;
  
  const factory AuthEvent.authCheckRequested() = _AuthCheckRequested;
} 