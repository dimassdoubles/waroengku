import '../../domain/entity/category.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/category_repository.dart';
import '../../share/errors/failures.dart';

import '../../share/errors/exceptions.dart';
import '../data_sources/category/remote_data_source.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Category>>> getCategories(String token) async {
    try {
      final result = await remoteDataSource.getCategories(token);
      return Right(result);
    } on GetCategoriesException catch (e) {
      return Left(GetCategoriesFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> createCategory({
    required String token,
    required String name,
  }) async {
    try {
      await remoteDataSource.createCategory(token: token, name: name);
      return const Right(null);
    } on NoAuthorizationException catch (e) {
      return Left(NoAuthorizationFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> updateCategory({
    required String token,
    required int id,
    required String newName,
  }) async {
    try {
      final result = await remoteDataSource.updateCategory(
        token: token,
        id: id,
        newName: newName,
      );
      return Right(result);
    } on NotFoundException catch (e) {
      return Left(NotFoundFailure(e.message));
    } on NoAuthorizationException catch (e) {
      return Left(NoAuthorizationFailure(e.message));
    }
  }
}
