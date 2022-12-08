import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../../injection_container.dart';
import '../../../blocs/auth/auth_bloc.dart';
import '../../../blocs/auth/auth_state.dart';
import 'signin_page.dart';
import 'signup_page.dart';
import '../../../../share/routes.dart';
import '../../../../share/styles/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late AuthBloc authBloc;

  int tab = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.animation!.addListener(tabListener);
    authBloc = getIt<AuthBloc>();
  }

  void tabListener() {
    if (tab != tabController.animation!.value.round()) {
    
      setState(() {
        tab = tabController.animation!.value.round();
      });
    }
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
            } else if (state is AuthFail) {
              Navigator.pop(context);
            } else if (state is Authenticated) {
              if (state.user.role == "admin") {
                Navigator.pushReplacementNamed(
                  context,
                  homeAdmin,
                  arguments: 0,
                );
              } else if (state.user.role == "user") {
                Navigator.pushReplacementNamed(context, dashboardPage);
              }
            }
          },
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  child: (tab == 0)
                      ? Lottie.asset(
                          "assets/lotties/signin2.json",
                          height: MediaQuery.of(context).size.height / 3,
                        )
                      : Lottie.asset(
                          "assets/lotties/signin.json",
                          height: MediaQuery.of(context).size.height / 3,
                        ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.withOpacity(0.3),
                        width: 1.5,
                      ),
                    ),
                  ),
                  child: TabBar(
                    controller: tabController,
                    labelColor: Colors.black,
                    labelStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
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
      ),
    );
  }
}
