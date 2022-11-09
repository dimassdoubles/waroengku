import 'package:dartz/dartz.dart';
import 'package:waroengku/domain/repositories/category_repository.dart';
import 'package:waroengku/share/errors/failures.dart';

class UpdateCategory {
  CategoryRepository repository;
  UpdateCategory(this.repository);

  Future<Either<Failure, void>> call({
    required String token,
    required int id,
    required String newName,
  }) async {
    return await repository.updateCategory(token: token, id: id, newName: newName);
  }
}
