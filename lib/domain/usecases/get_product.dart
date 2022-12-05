import 'package:dartz/dartz.dart';
import 'package:waroengku/domain/entity/product.dart';
import 'package:waroengku/domain/repositories/product_repository.dart';
import 'package:waroengku/share/errors/failures.dart';

import '../entity/category.dart';

class GetProduct {
  ProductRepository repository;
  GetProduct(this.repository);

  Future<Either<Failure, List<Product>>> call(
    String token,
    List<Category> categories,
  ) async {
    return await repository.getProduct(
      token: token,
      categories: categories,
    );
  }
}
