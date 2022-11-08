import 'package:dartz/dartz.dart';
import 'package:waroengku/domain/repositories/user_repository.dart';
import 'package:waroengku/share/errors/failures.dart';

class Logout {
  UserRepository repository;
  Logout(this.repository);

  Future<Either<Failure, void>> call(String token) async {
    return await repository.logout(token);
  }
}
