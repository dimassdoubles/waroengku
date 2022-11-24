import 'package:waroengku/domain/usecases/delete_product.dart';

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

class DeleteWishlistException implements Exception {
  String message;
  DeleteWishlistException(this.message);
}

class GetCartException implements Exception {
  String message;
  GetCartException(this.message);
}

class CreateCartException implements Exception {
  String message;
  CreateCartException(this.message);
}

class DeleteCartException implements Exception {
  String message;
  DeleteCartException(this.message);
}

class GetTransactionException implements Exception {
  String message;
  GetTransactionException(this.message);
}

class CreateTransactionException implements Exception {
  String message;
  CreateTransactionException(this.message);
}

class CreateReviewException implements Exception {
  String message;
  CreateReviewException(this.message);
}

class DeleteReviewException implements Exception {
  String message;
  DeleteReviewException(this.message);
}

class DeleteProductException implements Exception {
  String message;
  DeleteProductException(this.message);
}

class CreateProductException implements Exception {
  String message;
  CreateProductException(this.message);
}

class UpdateProductException implements Exception {
  String message;
  UpdateProductException(this.message);
}
