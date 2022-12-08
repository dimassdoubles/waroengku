import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/loading_widget.dart';
import '../../../injection_container.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/auth/auth_state.dart';
import '../../blocs/cart/cart_bloc.dart';
import '../../blocs/cart/cart_event.dart';
import '../../blocs/cart/cart_state.dart';
import '../../widgets/user_widgets/cart_item.dart';

import '../../widgets/user_widgets/checkout_button.dart';

class KeranjangPage extends StatefulWidget {
  const KeranjangPage({super.key});

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("Keranjang"),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          BlocBuilder(
            bloc: getIt<AuthBloc>(),
            builder: (context, authState) {
              if (authState is Authenticated) {
                getIt<CartBloc>().add(
                  CartGet(token: authState.user.token),
                );
                return BlocBuilder(
                  bloc: getIt<CartBloc>(),
                  builder: (context, cartState) {
                    if (cartState is CartLoaded) {
                      return ListView(
                        children: [
                          ...cartState.carts.map(
                            (e) => CartItem(cart: e),
                          ),
                          const SizedBox(
                            height: 72,
                          ),
                        ],
                      );
                    }
                 
                    getIt<CartBloc>().add(
                      CartGet(
                        token: authState.user.token,
                      ),
                    );
                    return const LoadingWidget();
                  },
                );
              }
              return const SizedBox();
            },
          ),
          const CheckoutButton(),
        ],
      ),
    );
  }
}
