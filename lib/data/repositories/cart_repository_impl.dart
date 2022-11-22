import 'package:waroengku/domain/entity/cart.dart';
import 'package:dartz/dartz.dart';
import 'package:waroengku/domain/repositories/cart_repository.dart';
import 'package:waroengku/share/errors/failures.dart';

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
}
