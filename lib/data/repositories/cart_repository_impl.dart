import '../../domain/entity/cart.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/cart_repository.dart';
import '../../share/errors/failures.dart';

import '../../share/errors/exceptions.dart';
import '../data_sources/cart/remote_data_source.dart';

class CartRepositoryImpl extends CartRepository {
  CartRemoteDataSource remoteDataSource;

  CartRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Cart>>> getCart(String token) async {
    try {
      final result = await remoteDataSource.getCart(token);
      return Right(result);
    } on GetCartException catch (e) {
      return Left(GetCartFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> createCart(
    String token,
    int productId,
    int quantity,
  ) async {
    try {
      await remoteDataSource.createCart(token, productId, quantity);
      return const Right(null);
    } on CreateCartException catch (e) {
      return Left(CreateCartFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCart(String token, int id) async {
    try {
      await remoteDataSource.deleteCart(token, id);
      return const Right(null);
    } on DeleteCartException catch (e) {
      return Left(DeleteCartFailure(e.message));
    }
  }
}
