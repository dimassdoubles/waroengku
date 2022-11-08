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
}
