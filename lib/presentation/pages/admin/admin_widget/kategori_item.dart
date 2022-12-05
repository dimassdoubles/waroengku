import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waroengku/domain/entity/category.dart';
import 'package:waroengku/domain/usecases/string_extension.dart';
import 'package:waroengku/injection_container.dart';
import 'package:waroengku/presentation/blocs/auth/auth_bloc.dart';
import 'package:waroengku/presentation/blocs/auth/auth_state.dart';
import 'package:waroengku/presentation/blocs/category/cat_bloc.dart';
import 'package:waroengku/presentation/blocs/category/cat_event.dart';
import 'package:waroengku/share/routes.dart';

import '../../../../share/styles/colors.dart';

class KategoriItem extends StatelessWidget {
  Category category;

  KategoriItem({
    required this.category,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: getIt<AuthBloc>(),
      builder: (context, authState) {
        if (authState is Authenticated) {
          return Padding(
            padding: const EdgeInsets.only(
              bottom: 16,
              left: 4,
              right: 4,
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: kPrimaryColor.withOpacity(0.3),
                        blurRadius: 3,
                        offset: const Offset(0.7, 1),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(category.name.removeCategoryPrevix()),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    editKategoriPage,
                                    arguments: category,
                                  );
                                },
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                ),
                              ),
                              const Text("|"),
                              InkWell(
                                onTap: () {
                                  final catBloc = getIt<CategoryBloc>();
                                  catBloc.add(
                                    CategoryDelete(
                                      token: authState.user.token,
                                      id: category.id,
                                    ),
                                  );
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
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
        return const SizedBox();
      },
    );
  }
}
