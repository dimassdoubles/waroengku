import 'package:dartz/dartz.dart';
import '../repositories/cart_repository.dart';
import '../../share/errors/failures.dart';

class CreateCart {
  CartRepository repository;
  CreateCart(this.repository);

  Future<Either<Failure, void>> call(
    String token,
    int productId,
    int quantity,
  ) async {
    return await repository.createCart(token, productId, quantity);
  }
}
