import 'package:dartz/dartz.dart';
import '../entity/category.dart';
import '../../share/errors/failures.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<Category>>> getCategories(String token);
}
