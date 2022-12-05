import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:waroengku/domain/entity/product.dart';
import 'package:waroengku/domain/entity/review.dart';
import 'package:waroengku/share/errors/failures.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProductByCategory({
    required String token,
    required int categoryId,
  });
  Future<Either<Failure, List<Review>>> getReviewByProductId({
    required String token,
    required int productId,
  });
  Future<Either<Failure, void>> deleteProduct(String token, int id);
  Future<Either<Failure, void>> createProduct(
    String token,
    String name,
    int categoryId,
    File image,
    int stock,
    String description,
    int price,
  );
}
