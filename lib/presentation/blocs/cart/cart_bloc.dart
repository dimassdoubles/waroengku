import 'package:bloc/bloc.dart';
import '../../../domain/usecases/create_cart.dart';
import '../../../domain/usecases/delete_cart.dart';
import '../../../domain/usecases/get_cart.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  GetCart getCart;
  CreateCart createCart;
  DeleteCart deleteCart;
  CartBloc({
    required this.getCart,
    required this.createCart,
    required this.deleteCart,
  }) : super(CartUnload()) {
    on<CartGet>(
      (event, emit) async {
        emit(CartOnload());
        final result = await getCart(event.token);
        result.fold(
          (l) => emit(CartUnload()),
          (r) => emit(CartLoaded(carts: r)),
        );
      },
    );
    on<CartCreate>(
      (event, emit) async {
        emit(CartOnload());
        await createCart(event.token, event.productId, event.quantity);
        final result = await getCart(event.token);
        result.fold(
          (l) => emit(CartUnload()),
          (r) => emit(CartLoaded(carts: r)),
        );
      },
    );
    on<CartDelete>(
      (event, emit) async {
        emit(CartOnload());
        await deleteCart(event.token, event.id);
        final result = await getCart(event.token);
        result.fold(
          (l) => emit(CartUnload()),
          (r) => emit(CartLoaded(carts: r)),
        );
      },
    );
  }
}
