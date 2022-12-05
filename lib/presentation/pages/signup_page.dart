import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waroengku/presentation/blocs/auth/auth_bloc.dart';
import 'package:waroengku/presentation/blocs/auth/auth_event.dart';
import 'package:waroengku/presentation/blocs/auth/auth_state.dart';
import 'package:waroengku/share/routes.dart';
import 'package:waroengku/share/styles/colors.dart';

import '../../injection_container.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  // late TextEditingController nameController;

  final AuthBloc authBloc = getIt<AuthBloc>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16,),
              SizedBox(
                child: TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Nama Lengkap"),
                  cursorColor: kPrimaryColor,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(), labelText: "Email"),
                  cursorColor: kPrimaryColor,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                child: TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(), labelText: "Handphone"),
                  cursorColor: kPrimaryColor,
                ),
              ),
              const SizedBox(
                height: 16,
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
                height: 16,
              ),
              SizedBox(
                child: TextFormField(
                  decoration: const InputDecoration(
                      fillColor: kPrimaryColor,
                      border: UnderlineInputBorder(),
                      labelText: "Confirm Password",
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
                  String name = nameController.text;
                  String email = emailController.text;
                  String phone = phoneController.text;
                  String password = passwordController.text;
                  print("$name $email $phone $password");
                  authBloc.add(
                    AuthRegister(
                      name: name,
                      email: email,
                      phone: phone,
                      password: password,
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
                    "Daftar",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
