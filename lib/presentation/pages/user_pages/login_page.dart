import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:lottie/lottie.dart';
import 'package:waroengku/injection_container.dart';
import 'package:waroengku/presentation/blocs/auth/auth_bloc.dart';
import 'package:waroengku/presentation/blocs/auth/auth_state.dart';
import 'package:waroengku/presentation/pages/user_pages/signin_page.dart';
import 'package:waroengku/presentation/pages/user_pages/signup_page.dart';
import 'package:waroengku/share/routes.dart';
import 'package:waroengku/share/styles/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late AuthBloc authBloc;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    authBloc = getIt<AuthBloc>();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener(
          bloc: authBloc,
          listener: (context, state) {
            if (state is AuthLoad) {
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
            } else if (state is Authenticated) {
              Navigator.pushReplacementNamed(context, homeAdmin, arguments: 0);
            }
          },
          child: Column(
            children: [
              Container(
                child: Lottie.asset(
                  "assets/lotties/108403-customer-need.json",
                  height: MediaQuery.of(context).size.height / 3,
                ),
              ),
              TabBar(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                controller: tabController,
                labelColor: kPrimaryColor,
                indicatorColor: kPrimaryColor,
                tabs: const [
                  Tab(
                    text: ("Sign In"),
                  ),
                  Tab(
                    text: ("Sign Up"),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    SignInPage(),
                    SignUpPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
