import 'package:dartz/dartz.dart';
import 'package:waroengku/domain/entity/product.dart';
import 'package:waroengku/share/errors/failures.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProductByCategory({
    required String token,
    required int categoryId,
  });
}
