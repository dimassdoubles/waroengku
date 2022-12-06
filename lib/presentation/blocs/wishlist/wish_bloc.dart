import 'package:bloc/bloc.dart';
import 'package:waroengku/domain/usecases/create_wishlist.dart';
import 'package:waroengku/domain/usecases/delete_wishlist.dart';
import 'package:waroengku/domain/usecases/get_wishlist.dart';
import 'package:waroengku/presentation/blocs/wishlist/wish_event.dart';
import 'package:waroengku/presentation/blocs/wishlist/wish_state.dart';

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
        print("mencoba get wihlist");
        emit(WishlistOnload());
        final result = await getWishlist(event.token);
        result.fold(
          (l) {
            print("get wishlist gagal");
            emit(WishlistUnload());
          },
          (r) {
            print("berhasil get wishlist di bloc");
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
