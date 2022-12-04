abstract class AuthEvent {}

class AuthLogin extends AuthEvent {
  String email;
  String password;
  AuthLogin({required this.email, required this.password});
}

class AuthStart extends AuthEvent {}

class AuthLogout extends AuthEvent {
  String token;
  AuthLogout(this.token);
}

class AuthRegister extends AuthEvent {
  String name;
  String email;
  String phone;
  String password;
  AuthRegister({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });
}
