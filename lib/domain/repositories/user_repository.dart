import 'package:dartz/dartz.dart';
import 'package:waroengku/share/errors/failures.dart';

abstract class UserRepository {
  Future<Either<Failure, void>> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  });
}
