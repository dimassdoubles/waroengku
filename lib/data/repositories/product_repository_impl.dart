import 'package:waroengku/data/data_sources/product/remote_data_source.dart';
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
}
