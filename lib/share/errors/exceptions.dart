class RegisterException implements Exception {
  String message;
  RegisterException(this.message);
}

class LoginException implements Exception {
  String message;
  LoginException(this.message);
}

class LogoutException implements Exception {
  String message;
  LogoutException(this.message);
}
