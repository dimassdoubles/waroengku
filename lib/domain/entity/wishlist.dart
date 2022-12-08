import 'package:equatable/equatable.dart';
import 'product.dart';

class Wishlist extends Equatable {
  final int _id, _userId;
  final Product _product;

  const Wishlist({
    required int id,
    required Product product,
    required int userId,
  })  : _id = id,
        _product = product,
        _userId = userId;

  int get id {
    return _id;
  }

  Product get product {
    return _product;
  }

  int get userId {
    return _userId;
  }

  @override
  List<Object?> get props => [_id, _product, _userId];
}
