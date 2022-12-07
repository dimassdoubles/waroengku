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
import 'package:waroengku/share/styles/colors.dart';

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
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            color: kPrimaryColor,
            child: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Rp 200.000',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Checkout",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
