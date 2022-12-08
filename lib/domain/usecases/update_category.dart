import 'package:dartz/dartz.dart';
import '../repositories/category_repository.dart';
import '../../share/errors/failures.dart';

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
