import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String _name, _email, _phone, _role, _token;
  final int _id;

  const User({
    required int id,
    required String name,
    required String email,
    required String phone,
    required String role,
    String token = "",
  })  : _id = id,
        _name = name,
        _email = email,
        _phone = phone,
        _role = role,
        _token = token;

  String get token {
    return _token;
  }

  String get name {
    return _name;
  }

  int get id {
    return _id;
  }

  String get email {
    return _email;
  }

  String get phone {
    return _phone;
  }

  String get role {
    return _role;
  }

  @override
  List<Object?> get props => [];
}
