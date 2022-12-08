import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../injection_container.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/auth/auth_state.dart';
import '../../blocs/wishlist/wish_bloc.dart';
import '../../blocs/wishlist/wish_event.dart';
import '../../blocs/wishlist/wish_state.dart';
import '../../../share/styles/colors.dart';

class FavoriteButton extends StatelessWidget {
  final int productId;
  const FavoriteButton({
    Key? key,
    required this.productId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: getIt<AuthBloc>(),
      builder: (context, authState) {
        if (authState is Authenticated) {
          return BlocBuilder(
            bloc: getIt<WishlistBloc>(),
            builder: (context, wishState) {
              if (wishState is WishlistLoaded) {
                final isFavorited = wishState.wishlist
                    .where((element) => element.product.id == productId)
                    .toList()
                    .isNotEmpty;
                if (isFavorited) {
                  final wishlist = wishState.wishlist
                      .where(
                        (element) => element.product.id == productId,
                      )
                      .toList()[0];
                  return InkWell(
                    onTap: () {
                      getIt<WishlistBloc>().add(
                        WishlistDelete(
                          id: wishlist.id,
                          token: authState.user.token,
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.favorite_rounded,
                      size: 30,
                      color: kPrimaryColor,
                    ),
                  );
                }
                return InkWell(
                  onTap: () {
                    getIt<WishlistBloc>().add(
                      WishlistCreate(
                        token: authState.user.token,
                        productId: productId,
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.favorite_outline_rounded,
                    size: 30,
                  ),
                );
              }
              getIt<WishlistBloc>().add(
                WishlistGet(
                  token: authState.user.token,
                ),
              );
              return const Icon(
                Icons.favorite_outline_rounded,
                size: 30,
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
