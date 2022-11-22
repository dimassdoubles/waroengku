import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final int _id, _productId, _userId, _quantity;

  const Cart({
    required int id,
    required int productId,
    required int userId,
    required int quantity,
  })  : _id = id,
        _productId = productId,
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

  int get productId {
    return _productId;
  }

  @override
  List<Object?> get props => [
        _id,
        _productId,
        _userId,
        _quantity,
      ];
}
