import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waroengku/injection_container.dart';
import 'package:waroengku/presentation/blocs/auth/auth_bloc.dart';
import 'package:waroengku/presentation/blocs/auth/auth_state.dart';
import 'package:waroengku/presentation/blocs/cart/cart_bloc.dart';
import 'package:waroengku/presentation/blocs/cart/cart_event.dart';
import 'package:waroengku/presentation/blocs/cart/cart_state.dart';
import 'package:waroengku/presentation/blocs/transaction/transaction_bloc.dart';
import 'package:waroengku/presentation/blocs/transaction/transaction_event.dart';
import 'package:waroengku/presentation/blocs/transaction/transaction_state.dart';

import '../../../share/routes.dart';
import '../../../share/styles/colors.dart';

class CheckoutButton extends StatefulWidget {
  const CheckoutButton({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckoutButton> createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<CheckoutButton> {
  bool active = false;
  TextEditingController addressController = TextEditingController();

  @override
  void dispose() {
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: getIt<TransactionBloc>(),
      listener: (context, tranState) {
        if (tranState is TransactionOnload) {
          print("transaksi loading");
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) {
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
        } else if (tranState is TransactionSuccess) {
          print("transaski berhasil, ke halaman success");
          Navigator.pushNamedAndRemoveUntil(
            context,
            successPage,
            (route) => false,
          );
        } else if (tranState is TransactionFail) {
          "transaksi gagal, loading di pop";
          Navigator.pop(context);
        }
      },
      child: BlocBuilder(
        bloc: getIt<AuthBloc>(),
        builder: (context, authState) {
          if (authState is Authenticated) {
            return BlocBuilder(
              bloc: getIt<CartBloc>(),
              builder: (context, cartState) {
                if (cartState is CartLoaded) {
                  if (cartState.carts.isEmpty) return const ButtonDisable();

                  int total = 0;
                  for (int i = 0; i < cartState.carts.length; i++) {
                    total += cartState.carts[i].product.price *
                        cartState.carts[i].quantity;
                  }
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    color: kPrimaryColor,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Total',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Rp $total',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                if (!active) {
                                  setState(() {
                                    active = true;
                                  });
                                } else {
                                  setState(() {
                                    active = false;
                                  });
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 16,
                                ),
                                decoration: BoxDecoration(
                                  color: active
                                      ? Colors.transparent
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  active ? "Close" : "Checkout",
                                  style: TextStyle(
                                    fontWeight: active
                                        ? FontWeight.normal
                                        : FontWeight.bold,
                                    color: active ? Colors.white : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        active
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    'Alamat',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  TextField(
                                    controller: addressController,
                                    cursorColor: Colors.white,
                                    decoration: const InputDecoration(
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      disabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      getIt<TransactionBloc>().add(
                                        TransactionCreate(
                                          token: authState.user.token,
                                          address: addressController.text,
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Text(
                                        "Buat Pesanan",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox(),
                      ],
                    ),
                  );
                }
                getIt<CartBloc>().add(
                  CartGet(
                    token: authState.user.token,
                  ),
                );
                return const ButtonDisable();
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class ButtonDisable extends StatelessWidget {
  const ButtonDisable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      color: Colors.grey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Total',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Rp -',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Checkout",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
