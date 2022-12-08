import 'package:bloc/bloc.dart';
import '../../../domain/usecases/create_wishlist.dart';
import '../../../domain/usecases/delete_wishlist.dart';
import '../../../domain/usecases/get_wishlist.dart';
import 'wish_event.dart';
import 'wish_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  GetWishlist getWishlist;
  CreateWishlist createWishlist;
  DeleteWishlist deleteWishlist;
  WishlistBloc({
    required this.getWishlist,
    required this.createWishlist,
    required this.deleteWishlist,
  }) : super(WishlistUnload()) {
    on<WishlistGet>(
      (event, emit) async {
        emit(WishlistOnload());
        final result = await getWishlist(event.token);
        result.fold(
          (l) {
            emit(WishlistUnload());
          },
          (r) {
            emit(WishlistLoaded(r));
          },
        );
      },
    );

    on<WishlistCreate>(
      (event, emit) async {
        emit(WishlistOnload());
        await createWishlist(event.token, event.productId);
        final result = await getWishlist(event.token);
        result.fold(
          (l) => emit(WishlistUnload()),
          (r) => emit(WishlistLoaded(r)),
        );
      },
    );

    on<WishlistDelete>(
      (event, emit) async {
        emit(WishlistOnload());
        await deleteWishlist(event.token, event.id);
        final result = await getWishlist(event.token);
        result.fold(
          (l) => emit(WishlistUnload()),
          (r) => emit(WishlistLoaded(r)),
        );
      },
    );
  }
}
