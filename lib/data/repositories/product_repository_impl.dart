import 'dart:io';

import 'package:waroengku/data/data_sources/product/remote_data_source.dart';
import 'package:waroengku/domain/entity/category.dart';
import 'package:waroengku/domain/entity/product.dart';
import 'package:dartz/dartz.dart';
import 'package:waroengku/domain/entity/review.dart';
import 'package:waroengku/domain/repositories/product_repository.dart';
import 'package:waroengku/share/errors/exceptions.dart';
import 'package:waroengku/share/errors/failures.dart';

class ProductRepositoryImpl extends ProductRepository {
  ProductRemoteDataSource remoteDataSource;
  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Product>>> getProductByCategory({
    required String token,
    required int categoryId,
  }) async {
    try {
      final result = await remoteDataSource.getProductByCategory(
        token: token,
        categoryId: categoryId,
      );
      return right(result);
    } on NotFoundException catch (e) {
      return Left(NotFoundFailure(e.message));
    } on NoAuthorizationException catch (e) {
      return Left(NoAuthorizationFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Review>>> getReviewByProductId({
    required String token,
    required int productId,
  }) async {
    try {
      final result = await remoteDataSource.getReviewByProductId(
        token: token,
        productId: productId,
      );
      return Right(result);
    } on NoAuthorizationException catch (e) {
      return Left(NoAuthorizationFailure(e.message));
    } on NotFoundException catch (e) {
      return Left(NotFoundFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(String token, int id) async {
    try {
      await remoteDataSource.deleteProduct(token, id);
      return const Right(null);
    } on DeleteProductException catch (e) {
      return Left(DeleteProductFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> createProduct(
      String token,
      String name,
      int categoryId,
      File image,
      int stock,
      String description,
      int price) async {
    try {
      await remoteDataSource.createProduct(
        token,
        name,
        categoryId,
        image,
        stock,
        description,
        price,
      );
      return const Right(null);
    } on CreateProductException catch (e) {
      return Left(CreateProductFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> updateProduct(
    String token,
    int id,
    String name,
    int categoryId,
    File image,
    int stock,
    String description,
    int price,
  ) async {
    try {
      await remoteDataSource.updateProduct(
          token, id, name, categoryId, image, stock, description, price);
      return const Right(null);
    } on UpdateProductException catch (e) {
      return Left(UpdateProductFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProduct({
    required String token,
    required List<Category> categories,
  }) async {
    try {
      final result = await remoteDataSource.getProduct(token);
      final listCategoryId = categories.map((e) => e.id).toList();
      List<Product> listProduct = [
        ...result
            .where((element) => listCategoryId.contains(element.categoryId))
      ];
      // untuk mengecek apakah berhasil mengambil produk
      // for (int i = 0; i < listProduct.length; i++) {
      //   print(listProduct[i].name);
      // }
      return Right(listProduct);
    } catch (e) {
      return Left(LazyFailure());
    }
  }
}
