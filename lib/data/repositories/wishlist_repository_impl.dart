import 'package:waroengku/domain/entity/wishlist.dart';
import 'package:dartz/dartz.dart';
import 'package:waroengku/domain/repositories/wishlist_repository.dart';
import 'package:waroengku/share/errors/failures.dart';

import '../../share/errors/exceptions.dart';
import '../data_sources/wishlist/remote_data_source.dart';

class WishlistRepositoryImpl extends WishlistRepository {
  WishlistRemoteDataSource remoteDataSource;
  WishlistRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, List<Wishlist>>> getWishlist(String token) async {
    try {
      final result = await remoteDataSource.getWishlist(token);
      return Right(result);
    } on GetWishlistException catch (e) {
      return Left(
        GetWishlistFailure(e.message),
      );
    }
  }

  @override
  Future<Either<Failure, void>> createWishlist(
      String token, int productId) async {
    try {
      await remoteDataSource.createWishlist(token, productId);
      return const Right(null);
    } on CreateWishlistException catch (e) {
      return Left(CreateWishlistFailure(e.message));
    }
  }
}
