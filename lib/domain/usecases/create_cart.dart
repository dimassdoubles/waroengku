import 'package:dartz/dartz.dart';
import 'package:waroengku/domain/repositories/cart_repository.dart';
import 'package:waroengku/share/errors/failures.dart';

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
