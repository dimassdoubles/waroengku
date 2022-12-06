import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waroengku/injection_container.dart';
import 'package:waroengku/presentation/blocs/auth/auth_bloc.dart';
import 'package:waroengku/presentation/blocs/auth/auth_state.dart';
import 'package:waroengku/presentation/blocs/category/cat_bloc.dart';
import 'package:waroengku/presentation/blocs/category/cat_event.dart';
import 'package:waroengku/presentation/blocs/category/cat_state.dart';
import 'package:waroengku/presentation/blocs/product/product_bloc.dart';
import 'package:waroengku/presentation/blocs/product/product_event.dart';
import 'package:waroengku/presentation/blocs/product/product_state.dart';
import 'package:waroengku/share/styles/colors.dart';

import '../../widgets/admin_widgets/katalog_item.dart';

class KatalogPage extends StatefulWidget {
  @override
  _KatalogPageState createState() => _KatalogPageState();
}

class _KatalogPageState extends State<KatalogPage> {
  AuthBloc authBloc = getIt<AuthBloc>();
  CategoryBloc catBloc = getIt<CategoryBloc>();
  ProductBloc prodBloc = getIt<ProductBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: authBloc,
        builder: (context, authState) {
          if (authState is Authenticated) {
            return BlocBuilder(
              bloc: catBloc,
              builder: (context, catState) {
                if (catState is CategoryLoaded) {
                  return BlocBuilder(
                    bloc: prodBloc,
                    builder: (context, prodState) {
                      if (prodState is ProductLoaded) {
                        return Column(
                          children: [
                            Expanded(
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  ...prodState.products.map(
                                    (e) => KatalogItem(
                                      product: e,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 72,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      } else {
                        prodBloc.add(
                          ProductGet(
                            token: authState.user.token,
                            categories: catState.categories,
                          ),
                        );
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
                      }
                    },
                  );
                }
                catBloc.add(CategoryGet(authState.user.token));
                return const SizedBox();
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
