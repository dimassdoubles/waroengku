import 'package:dartz/dartz.dart';
import '../repositories/cart_repository.dart';
import '../../share/errors/failures.dart';

class DeleteCart {
  CartRepository repository;
  DeleteCart(this.repository);

  Future<Either<Failure, void>> call(String token, int id) async {
    return await repository.deleteCart(token, id);
  }
}
