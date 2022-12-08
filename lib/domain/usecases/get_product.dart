import 'package:dartz/dartz.dart';
import '../entity/product.dart';
import '../repositories/product_repository.dart';
import '../../share/errors/failures.dart';

import '../entity/category.dart';

class GetProduct {
  ProductRepository repository;
  GetProduct(this.repository);

  Future<Either<Failure, List<Product>>> call({
    required String token,
    required List<Category> categories,
  }) async {
    return await repository.getProduct(
      token: token,
      categories: categories,
    );
  }
}
