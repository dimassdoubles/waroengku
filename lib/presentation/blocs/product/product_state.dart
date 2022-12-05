import 'package:equatable/equatable.dart';
import 'package:waroengku/domain/entity/product.dart';

abstract class ProductState extends Equatable {}

class ProductUnload extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductOnload extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoaded extends ProductState {
  final List<Product> products;
  ProductLoaded(this.products);
  @override
  List<Object?> get props => [products];
}
