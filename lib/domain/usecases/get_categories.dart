import 'package:dartz/dartz.dart';
import '../../share/errors/failures.dart';

import '../entity/category.dart';
import '../repositories/category_repository.dart';

class GetCategories {
  CategoryRepository repository;
  GetCategories(this.repository);

  Future<Either<Failure, List<Category>>> call(String token) async {
    return await repository.getCategories(token);
  }
}
