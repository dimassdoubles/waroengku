import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../blocs/auth/auth_bloc.dart';
import '../../../../blocs/auth/auth_state.dart';
import '../../../../blocs/category/cat_bloc.dart';
import '../../../../blocs/category/cat_event.dart';
import '../../../../blocs/category/cat_state.dart';
import '../../../../blocs/wishlist/wish_state.dart';
import '../../../../widgets/user_widgets/wishlist_item.dart';
import '../../../../../injection_container.dart';
import '../../../../../share/routes.dart';
import '../../../../../share/styles/colors.dart';
import '../../../../blocs/wishlist/wish_bloc.dart';
import '../../../../blocs/wishlist/wish_event.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: getIt<AuthBloc>(),
      builder: (context, authState) {
        if (authState is Authenticated) {
          getIt<WishlistBloc>().add(
            WishlistGet(
              token: authState.user.token,
            ),
          );
          return BlocBuilder(
            bloc: getIt<CategoryBloc>(),
            builder: (context, catState) {
              if (catState is CategoryLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SafeArea(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Header(name: authState.user.name),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder(
                        bloc: getIt<WishlistBloc>(),
                        builder: (context, wishState) {
                          if (wishState is WishlistLoaded) {
                            return const WishlistContent();
                          }
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                CircularProgressIndicator(
                                  color: kPrimaryColor,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
              getIt<CategoryBloc>().add(CategoryGet(authState.user.token));
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  ],
                ),
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}

class WishlistContent extends StatelessWidget {
  const WishlistContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: getIt<WishlistBloc>(),
      builder: (context, wishState) {
        if (wishState is WishlistLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GridView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 2 / 3,
              ),
              children: [
                ...wishState.wishlist.map((e) => WishlistItem(e)),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}

class Header extends StatelessWidget {
  final String name;
  const Header({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Daftar Wishlist",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, keranjangPage);
            },
            child: const Icon(
              Icons.shopping_cart,
              color: kPrimaryColor,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
