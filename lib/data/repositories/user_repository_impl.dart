import 'package:dartz/dartz.dart';
import 'package:waroengku/domain/entity/user.dart';
import 'package:waroengku/domain/repositories/user_repository.dart';
import 'package:waroengku/share/errors/failures.dart';

import '../../share/errors/exceptions.dart';
import '../data_sources/user/remote_data_source.dart';

class UserRepositoryImpl extends UserRepository {
  UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, void>> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      final result = await remoteDataSource.register(
        name: name,
        email: email,
        phone: phone,
        password: password,
      );
      return Right(result);
    } on RegisterException catch (e) {
      return Left(
        RegisterFailure(e.message),
      );
    }
  }

  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result =
          await remoteDataSource.login(email: email, password: password);
      return Right(result);
    } on LoginException catch (e) {
      return Left(LoginFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> logout(String token) async {
    try {
      return Right(await remoteDataSource.logout(token));
    } on LogoutException catch (e) {
      return Left(LogoutFailure(e.message));
    }
  }
}
