import 'package:equatable/equatable.dart';

class DetailTransaction extends Equatable {
  final int _productId, _quantity;
  const DetailTransaction({
    required int productId,
    required int quantity,
  })  : _productId = productId,
        _quantity = quantity;

  int get quantity {
    return _quantity;
  }

  int get productId {
    return _productId;
  }

  @override
  List<Object?> get props => [
        _productId,
        _quantity,
      ];
}
