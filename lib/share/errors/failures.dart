// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class RegisterFailure extends Failure {
  String message;
  RegisterFailure(this.message);
  @override
  List<Object?> get props => [message];
}

class LoginFailure extends Failure {
  String message;
  LoginFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class LogoutFailure extends Failure {
  String message;
  LogoutFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class GetCategoriesFailure extends Failure {
  String message;
  GetCategoriesFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class NoAuthorizationFailure extends Failure {
  String message;
  NoAuthorizationFailure(this.message);
  @override
  List<Object?> get props => [message];
}

class NotFoundFailure extends Failure {
  String message;
  NotFoundFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class GetWishlistFailure extends Failure {
  String message;
  GetWishlistFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class CreateWishlistFailure extends Failure {
  String message;
  CreateWishlistFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class DeleteWishlistFailure extends Failure {
  String message;
  DeleteWishlistFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class GetCartFailure extends Failure {
  String message;
  GetCartFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class CreateCartFailure extends Failure {
  String message;
  CreateCartFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class DeleteCartFailure extends Failure {
  String message;
  DeleteCartFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class GetTransactionFailure extends Failure {
  String message;
  GetTransactionFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class CreateTransactionFailure extends Failure {
  String message;
  CreateTransactionFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class CreateReviewFailure extends Failure {
  String message;
  CreateReviewFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class DeleteReviewFailure extends Failure {
  String message;
  DeleteReviewFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class DeleteProductFailure extends Failure {
  String message;
  DeleteProductFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class CreateProductFailure extends Failure {
  String message;
  CreateProductFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class UpdateProductFailure extends Failure {
  String message;
  UpdateProductFailure(this.message);

  @override
  List<Object?> get props => [message];
}

// dikejar deadline, utamakan fitur selesai
class LazyFailure extends Failure {
  @override
  List<Object?> get props => [];
}
