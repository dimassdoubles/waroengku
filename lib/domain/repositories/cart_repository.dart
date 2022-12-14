import 'package:dartz/dartz.dart';
import '../entity/cart.dart';
import '../../share/errors/failures.dart';

abstract class CartRepository {
  Future<Either<Failure, List<Cart>>> getCart(String token);
  Future<Either<Failure, void>> createCart(
    String token,
    int productId,
    int quantity,
  );
  Future<Either<Failure, void>> deleteCart(String token, int id);
}
