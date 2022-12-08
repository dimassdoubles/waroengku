import 'package:equatable/equatable.dart';
import 'product.dart';

class Cart extends Equatable {
  final int _id, _userId, _quantity;
  final Product _product;

  const Cart({
    required int id,
    required Product product,
    required int userId,
    required int quantity,
  })  : _id = id,
        _product = product,
        _userId = userId,
        _quantity = quantity;

  int get quantity {
    return _quantity;
  }

  int get userId {
    return _userId;
  }

  int get id {
    return _id;
  }

  Product get product {
    return _product;
  }

  @override
  List<Object?> get props => [
        _id,
        _product,
        _userId,
        _quantity,
      ];
}
