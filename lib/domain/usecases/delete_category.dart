import 'package:dartz/dartz.dart';
import 'package:waroengku/domain/repositories/category_repository.dart';
import 'package:waroengku/share/errors/failures.dart';

class DeleteCategory {
  CategoryRepository repository;
  DeleteCategory(this.repository);

  Future<Either<Failure, void>> call({
    required String token,
    required int id,
  }) async {
    return await repository.deleteCategory(
      token,
      id,
    );
  }
}
