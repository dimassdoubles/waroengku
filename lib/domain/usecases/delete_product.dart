import 'package:dartz/dartz.dart';
import 'package:waroengku/domain/repositories/product_repository.dart';
import 'package:waroengku/share/errors/failures.dart';

class DeleteProduct {
  ProductRepository repository;
  DeleteProduct(this.repository);

  Future<Either<Failure, void>> call({
    required String token,
    required int id,
  }) async {
    return await repository.deleteProduct(token, id);
  }
}
