import 'package:dartz/dartz.dart';
import '../entity/wishlist.dart';
import '../../share/errors/failures.dart';

import '../repositories/wishlist_repository.dart';

class GetWishlist {
  WishlistRepository repository;
  GetWishlist(this.repository);

  Future<Either<Failure, List<Wishlist>>> call(String token) async {
    return await repository.getWishlist(token);
  }
}
