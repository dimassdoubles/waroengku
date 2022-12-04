import 'package:dartz/dartz.dart';
import 'package:waroengku/share/errors/failures.dart';

import '../entity/cart.dart';
import '../repositories/cart_repository.dart';

class GetCart {
  CartRepository repository;
  GetCart(this.repository);

  Future<Either<Failure, List<Cart>>> call(String token) async {
    return await repository.getCart(token);
  }
}
