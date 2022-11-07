import 'package:dartz/dartz.dart';
import 'package:waroengku/domain/repositories/user_repository.dart';
import 'package:waroengku/share/errors/failures.dart';

class Register {
  final UserRepository repository;
  Register(this.repository);

  Future<Either<Failure, void>> call({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    return await repository.register(
      name: name,
      email: email,
      phone: phone,
      password: password,
    );
  }
}
