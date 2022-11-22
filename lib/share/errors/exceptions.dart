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

class GetCategoriesException implements Exception {
  String message;
  GetCategoriesException(this.message);
}

class NoAuthorizationException implements Exception {
  String message;
  NoAuthorizationException(this.message);
}

class NotFoundException implements Exception {
  String message;
  NotFoundException(this.message);
}

class GetWishlistException implements Exception {
  String message;
  GetWishlistException(this.message);
}

class CreateWishlistException implements Exception {
  String message;
  CreateWishlistException(this.message);
}
