import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waroengku/domain/usecases/loading_widget.dart';
import 'package:waroengku/injection_container.dart';
import 'package:waroengku/presentation/blocs/auth/auth_bloc.dart';
import 'package:waroengku/presentation/blocs/auth/auth_state.dart';
import 'package:waroengku/presentation/blocs/cart/cart_bloc.dart';
import 'package:waroengku/presentation/blocs/cart/cart_event.dart';
import 'package:waroengku/presentation/blocs/cart/cart_state.dart';

import '../../../share/styles/colors.dart';

class CreateCartButton extends StatelessWidget {
  int productId, quantity;
  CreateCartButton({
    Key? key,
    required this.productId,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: getIt<AuthBloc>(),
      builder: (context, authState) {
        if (authState is Authenticated) {
          return BlocBuilder(
            bloc: getIt<CartBloc>(),
            builder: (context, cartState) {
              if (cartState is CartLoaded) {
                return InkWell(
                  onTap: () {
                    getIt<CartBloc>().add(
                      CartCreate(
                        token: authState.user.token,
                        productId: productId,
                        quantity: quantity,
                      ),
                    );
                  },
                  child: Container(
                    color: kPrimaryColor,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.add_shopping_cart_rounded,
                          size: 24,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Tambahkan Ke Keranjang',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              }
              getIt<CartBloc>().add(
                CartGet(
                  token: authState.user.token,
                ),
              );
              return Container(
                color: Colors.grey,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.add_shopping_cart_rounded,
                      size: 24,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Tambahkan Ke Keranjang',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
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
