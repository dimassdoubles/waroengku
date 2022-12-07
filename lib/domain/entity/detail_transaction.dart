import 'package:equatable/equatable.dart';
import 'package:waroengku/domain/entity/product.dart';

class DetailTransaction extends Equatable {
  final int _quantity;
  final Product _product;
  const DetailTransaction({
    required Product product,
    required int quantity,
  })  : _product = product,
        _quantity = quantity;

  int get quantity {
    return _quantity;
  }

  Product get product {
    return _product;
  }

  @override
  List<Object?> get props => [
        _product,
        _quantity,
      ];
}
