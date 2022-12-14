import 'package:dartz/dartz.dart';
import '../entity/wishlist.dart';
import '../../share/errors/failures.dart';

abstract class WishlistRepository {
  Future<Either<Failure, List<Wishlist>>> getWishlist(String token);
  Future<Either<Failure, void>> createWishlist(String token, int productId);
  Future<Either< Failure, void>> deleteWishlist(String token, int id);
}
