import 'package:equatable/equatable.dart';

class Wishlist extends Equatable {
  final int _id, _productId, _userId;

  const Wishlist({
    required int id,
    required int productId,
    required int userId,
  })  : _id = id,
        _productId = productId,
        _userId = userId;

  int get id {
    return _id;
  }

  int get productId {
    return _productId;
  }

  int get userId {
    return _userId;
  }

  @override
  List<Object?> get props => [_id, _productId, _userId];
}
