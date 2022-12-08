import 'package:dartz/dartz.dart';
import '../repositories/category_repository.dart';
import '../../share/errors/failures.dart';

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
