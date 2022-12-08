import 'package:dartz/dartz.dart';
import '../repositories/product_repository.dart';
import '../../share/errors/failures.dart';

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
