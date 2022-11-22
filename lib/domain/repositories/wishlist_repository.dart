import 'package:dartz/dartz.dart';
import 'package:waroengku/domain/entity/wishlist.dart';
import 'package:waroengku/share/errors/failures.dart';

abstract class WishlistRepository {
  Future<Either<Failure, List<Wishlist>>> getWishlist(String token);
}
