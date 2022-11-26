import 'package:dartz/dartz.dart';
import 'package:waroengku/domain/repositories/wishlist_repository.dart';
import 'package:waroengku/share/errors/failures.dart';

class CreateWishlist {
  WishlistRepository repository;
  CreateWishlist(this.repository);

  Future<Either<Failure, void>> call(String token, int productId) async {
    return await repository.createWishlist(token, productId);
  }
}
