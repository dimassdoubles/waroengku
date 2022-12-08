import 'dart:io';

import 'package:dartz/dartz.dart';
import '../entity/product.dart';
import '../entity/review.dart';
import '../../share/errors/failures.dart';

import '../entity/category.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProduct({
    required String token,
    required List<Category> categories,
  });

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
  Future<Either<Failure, void>> updateProduct(
    String token,
    int id,
    String name,
    int categoryId,
    File image,
    int stock,
    String description,
    int price,
  );
}
