import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waroengku/domain/usecases/loading_widget.dart';
import 'package:waroengku/injection_container.dart';
import 'package:waroengku/presentation/blocs/auth/auth_bloc.dart';
import 'package:waroengku/presentation/blocs/auth/auth_state.dart';
import 'package:waroengku/presentation/blocs/cart/cart_bloc.dart';
import 'package:waroengku/presentation/blocs/cart/cart_event.dart';
import 'package:waroengku/presentation/blocs/cart/cart_state.dart';
import 'package:waroengku/presentation/pages/admin_pages/admin_edit_katalog.dart';
import 'package:waroengku/presentation/pages/user_pages/success_page.dart';
import 'package:waroengku/presentation/widgets/user_widgets/cart_item.dart';
import 'package:waroengku/share/routes.dart';
import 'package:waroengku/share/styles/colors.dart';

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
                    print("mengambil cart nih");
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
          CheckoutButton(),
        ],
      ),
    );
  }
}
