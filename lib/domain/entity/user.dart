import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String _id, _name, _email, _phone, _role, _token;

  const User({
    required String id,
    required String name,
    required String email,
    required String phone,
    required String role,
    required String token,
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

  String get id {
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
