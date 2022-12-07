import 'package:equatable/equatable.dart';
import 'package:waroengku/domain/entity/cart.dart';

abstract class CartState extends Equatable {}

class CartUnload extends CartState {
  @override
  List<Object?> get props => [];
}

class CartOnload extends CartState {
  @override
  List<Object?> get props => [];
}

class CartLoaded extends CartState {
  List<Cart> carts;
  CartLoaded({required this.carts});
  @override
  List<Object?> get props => [carts];
}
