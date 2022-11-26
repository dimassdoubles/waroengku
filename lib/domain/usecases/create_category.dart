import 'package:dartz/dartz.dart';
import 'package:waroengku/domain/repositories/category_repository.dart';
import 'package:waroengku/share/errors/failures.dart';

class CreateCategory {
  CategoryRepository repository;
  CreateCategory(this.repository);

  Future<Either<Failure, void>> call({required String token, required String name}) async {
    return await repository.createCategory(token: token, name: name);
  }
}
