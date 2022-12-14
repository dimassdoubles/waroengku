// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waroengku/presentation/blocs/auth/auth_bloc.dart';
import 'package:waroengku/presentation/blocs/auth/auth_state.dart';
import 'package:waroengku/presentation/blocs/category/cat_bloc.dart';
import 'package:waroengku/presentation/blocs/category/cat_event.dart';
import 'package:waroengku/presentation/blocs/category/cat_state.dart';
import 'package:waroengku/share/styles/colors.dart';

import '../../../injection_container.dart';
import '../../widgets/admin_widgets/kategori_item.dart';

class KategoriPage extends StatefulWidget {
  const KategoriPage({super.key});

  @override
  _KategoriPageState createState() => _KategoriPageState();
}

class _KategoriPageState extends State<KategoriPage> {
  final AuthBloc authBloc = getIt<AuthBloc>();
  final CategoryBloc catBloc = getIt<CategoryBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: authBloc,
        builder: (context, authState) {
          if (authState is Authenticated) {
            catBloc.add(CategoryGet(authState.user.token));

            return BlocBuilder(
              bloc: catBloc,
              builder: (context, catState) {
                if (catState is CategoryLoaded) {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            ...catState.categories
                                .map(
                                  (e) => KategoriItem(category: e),
                                )
                                .toList(),
                            const SizedBox(
                              height: 72,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
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
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
