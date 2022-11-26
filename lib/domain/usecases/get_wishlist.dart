import 'package:dartz/dartz.dart';
import 'package:waroengku/domain/entity/wishlist.dart';
import 'package:waroengku/share/errors/failures.dart';

import '../repositories/wishlist_repository.dart';

class GetWishlist {
  WishlistRepository repository;
  GetWishlist(this.repository);

  Future<Either<Failure, List<Wishlist>>> call(String token) async {
    return await repository.getWishlist(token);
  }
}
