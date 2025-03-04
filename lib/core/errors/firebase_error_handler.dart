class FirebaseErrorHandler {
  static String handleAuthError(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'Этот email уже используется другим аккаунтом';
      case 'invalid-email':
        return 'Некорректный email адрес';
      case 'operation-not-allowed':
        return 'Операция не разрешена';
      case 'weak-password':
        return 'Пароль слишком простой';
      case 'user-disabled':
        return 'Пользователь заблокирован';
      case 'user-not-found':
        return 'Пользователь не найден';
      case 'wrong-password':
        return 'Неверный пароль';
      case 'invalid-verification-code':
        return 'Неверный код подтверждения';
      case 'invalid-verification-id':
        return 'Неверный ID подтверждения';
      default:
        return 'Произошла ошибка: $code';
    }
  }

  static String handleFirestoreError(String code) {
    switch (code) {
      case 'permission-denied':
        return 'Нет прав доступа';
      case 'not-found':
        return 'Документ не найден';
      default:
        return 'Произошла ошибка: $code';
    }
  }
} 