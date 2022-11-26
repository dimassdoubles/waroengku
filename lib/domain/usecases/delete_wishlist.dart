import 'package:dartz/dartz.dart';
import 'package:waroengku/domain/repositories/wishlist_repository.dart';
import 'package:waroengku/share/errors/failures.dart';

class DeleteWishlist {
  WishlistRepository repository;
  DeleteWishlist(this.repository);

  Future<Either<Failure, void>> call(String token, int id) async {
    return await repository.deleteWishlist(token, id);
  }
}
