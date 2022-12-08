import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../domain/usecases/loading_widget.dart';
import '../../../../../injection_container.dart';
import '../../../../blocs/auth/auth_bloc.dart';
import '../../../../blocs/auth/auth_state.dart';
import '../../../../blocs/transaction/transaction_event.dart';
import '../../../../blocs/transaction/transaction_state.dart';
import '../../../../widgets/user_widgets/transaction_item.dart';

import '../../../../../share/routes.dart';
import '../../../../../share/styles/colors.dart';
import '../../../../blocs/transaction/transaction_bloc.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: const SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Header(),
            ),
          ),
        ),
        Expanded(
          child: BlocBuilder(
              bloc: getIt<AuthBloc>(),
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return BlocBuilder(
                    bloc: getIt<TransactionBloc>(),
                    builder: (context, tranState) {
                      if (tranState is TransactionLoaded) {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 16,
                              ),
                              ...tranState.transactions.map(
                                (e) => TransactionItem(transaction: e),
                              ),
                            ],
                          ),
                        );
                      }
                      getIt<TransactionBloc>().add(
                        TransactionGet(token: authState.user.token),
                      );
                      return const LoadingWidget();
                    },
                  );
                }
                return const SizedBox();
              }),
        ),
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Daftar Transaksi",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
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
