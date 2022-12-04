import 'package:equatable/equatable.dart';
import 'package:waroengku/domain/entity/user.dart';

abstract class AuthState extends Equatable {}

class AuthInit extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoad extends AuthState {
  @override
  List<Object?> get props => [];
}

class UnAuthenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthState {
  User user;
  Authenticated(this.user);
  @override
  List<Object?> get props => [user];
}

class AuthFail extends AuthState {
  @override
  List<Object?> get props => [];
}
