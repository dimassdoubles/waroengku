import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waroengku/injection_container.dart';
import 'package:waroengku/presentation/blocs/auth/auth_bloc.dart';
import 'package:waroengku/presentation/blocs/auth/auth_event.dart';

import '../../../../../share/styles/colors.dart';
import '../../../../blocs/auth/auth_state.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: getIt<AuthBloc>(),
      builder: (context, state) {
        if (state is Authenticated) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: kPrimaryColor,
                child: Icon(
                  Icons.person,
                  size: 72,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Center(
                child: Text(
                  state.user.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: Text(
                  state.user.email,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Center(
                child: Text(
                  state.user.phone,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              TextButton(
                onPressed: () {
                  getIt<AuthBloc>().add(
                    AuthLogout(
                      state.user.token,
                    ),
                  );
                },
                child: const Text(
                  "Keluar",
                  style: TextStyle(
                    color: kPrimaryColor,
                    // fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
