import 'package:dartz/dartz.dart';
import 'package:waroengku/share/errors/failures.dart';

import '../entity/product.dart';
import '../repositories/product_repository.dart';

class GetProductByCategory {
  ProductRepository repository;
  GetProductByCategory(this.repository);

  Future<Either<Failure, List<Product>>> call({
    required String token,
    required int categoryId,
  }) async {
    return await repository.getProductByCategory(
      token: token,
      categoryId: categoryId,
    );
  }
}
