import 'package:flutter/material.dart';
import '../../../blocs/auth/auth_bloc.dart';
import '../../../blocs/auth/auth_event.dart';
import '../../../../share/styles/colors.dart';

import '../../../../injection_container.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final authBloc = getIt<AuthBloc>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: "Email Address"),
                cursorColor: kPrimaryColor,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              child: TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                    fillColor: kPrimaryColor,
                    border: UnderlineInputBorder(),
                    labelText: "Password",
                    suffixIcon: Icon(Icons.remove_red_eye)),
                cursorColor: kPrimaryColor,
                obscureText: true,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                authBloc.add(
                  // untuk memudahkan login sebagai user
                  AuthLogin(
                    email: emailController.text,
                    password: passwordController.text,
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: kPrimaryColor,
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
