import 'package:dartz/dartz.dart';
import '../repositories/wishlist_repository.dart';
import '../../share/errors/failures.dart';

class CreateWishlist {
  WishlistRepository repository;
  CreateWishlist(this.repository);

  Future<Either<Failure, void>> call(String token, int productId) async {
    return await repository.createWishlist(token, productId);
  }
}
