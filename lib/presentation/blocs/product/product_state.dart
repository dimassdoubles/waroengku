import 'package:equatable/equatable.dart';
import '../../../domain/entity/product.dart';

abstract class ProductState extends Equatable {}

class ProductUnload extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductSuccess extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductFail extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductOnload extends ProductState {
  @override
  List<Object?> get props => [];
}
class ProductCreateOnload extends ProductState {
  @override
  List<Object?> get props => [];
}
class ProductEditOnload extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoaded extends ProductState {
  final List<Product> products;
  ProductLoaded(this.products);
  @override
  List<Object?> get props => [products];
}
