import 'package:dartz/dartz.dart';
import '../entity/category.dart';
import '../../share/errors/failures.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<Category>>> getCategories(String token);

  Future<Either<Failure, void>> createCategory({
    required String token,
    required String name,
  });

  Future<Either<Failure, void>> updateCategory({
    required String token,
    required int id,
    required String newName,
  });
}
