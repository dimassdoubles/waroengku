import 'package:dartz/dartz.dart';
import 'package:waroengku/domain/entity/cart.dart';
import 'package:waroengku/share/errors/failures.dart';

abstract class CartRepository {
  Future<Either<Failure, List<Cart>>> getCart(String token);
}