import 'package:dartz/dartz.dart';
import 'package:waroengku/domain/entity/user.dart';
import 'package:waroengku/domain/repositories/user_repository.dart';
import 'package:waroengku/share/errors/failures.dart';

class Login {
  UserRepository repository;
  Login(this.repository);

  Future<Either<Failure, User>> call(
      {required String email, required String password}) async {
    return await repository.login(email: email, password: password);
  }
}
