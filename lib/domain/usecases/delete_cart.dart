import 'package:dartz/dartz.dart';
import 'package:waroengku/domain/repositories/cart_repository.dart';
import 'package:waroengku/share/errors/failures.dart';

class DeleteCart {
  CartRepository repository;
  DeleteCart(this.repository);

  Future<Either<Failure, void>> call(String token, int id) async {
    return await repository.deleteCart(token, id);
  }
}
