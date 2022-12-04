import 'package:dartz/dartz.dart';
import '../entity/user.dart';
import '../repositories/user_repository.dart';
import '../../share/errors/failures.dart';

class Login {
  UserRepository repository;
  Login(this.repository);

  Future<Either<Failure, User>> call(
      {required String email, required String password}) async {
    return await repository.login(email: email, password: password);
  }
}
