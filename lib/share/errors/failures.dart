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
