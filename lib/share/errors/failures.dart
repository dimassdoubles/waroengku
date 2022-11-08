import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

// ignore: must_be_immutable
class RegisterFailure extends Failure {
  String message;
  RegisterFailure(this.message);
  @override
  List<Object?> get props => [message];
}

// ignore: must_be_immutable
class LoginFailure extends Failure {
  String message;
  LoginFailure(this.message);

  @override
  List<Object?> get props => [message];
}
