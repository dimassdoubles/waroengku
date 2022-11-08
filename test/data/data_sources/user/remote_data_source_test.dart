import 'package:flutter_test/flutter_test.dart';
import 'package:waroengku/data/data_sources/user/remote_data_source.dart';
import 'package:waroengku/domain/entity/user.dart';
import 'package:waroengku/share/errors/exceptions.dart';

void main() {
  UserRemoteDataSourceImpl remoteDataSource = UserRemoteDataSourceImpl();

  group(
    "register",
    () {
      final specialCharacter = DateTime.now().microsecondsSinceEpoch;
      final email = "$specialCharacter@gmail.com";
      final phone = "$specialCharacter";

      const String name = "dimas";
      const String password = "password";
      test(
        "should register new user",
        () async {
          await remoteDataSource.register(
            name: name,
            email: email,
            password: password,
            phone: phone,
          );
        },
      );

      test(
        "should throw RegisterException when email and phone already been taken",
        () async {
          try {
            await remoteDataSource.register(
                name: name, email: email, password: password, phone: phone);
          } on RegisterException catch (e) {
            expect(
              e.message,
              "The email has already been taken and The handphone has already been taken.",
            );
          }
        },
      );

      test(
        "should throw RegisterException when email already been taken",
        () async {
          try {
            await remoteDataSource.register(
              name: name,
              email: email,
              password: password,
              phone: DateTime.now().microsecondsSinceEpoch.toString(),
            );
          } on RegisterException catch (e) {
            expect(
              e.message,
              "The email has already been taken.",
            );
          }
        },
      );

      test(
        "should throw RegisterException when phone already been taken",
        () async {
          try {
            await remoteDataSource.register(
              name: name,
              email: "${DateTime.now().microsecondsSinceEpoch}@gmail.com",
              password: password,
              phone: phone,
            );
          } on RegisterException catch (e) {
            expect(
              e.message,
              "The handphone has already been taken.",
            );
          }
        },
      );

      test(
        "should throw RegisterException when phone is not only number",
        () async {
          try {
            await remoteDataSource.register(
              name: name,
              email: "${DateTime.now().microsecondsSinceEpoch}@gmail.com",
              password: password,
              phone: "${DateTime.now().microsecondsSinceEpoch}abc",
            );
          } on RegisterException catch (e) {
            expect(
              e.message,
              "The handphone must be a number.",
            );
          }
        },
      );
    },
  );

  group(
    "login",
    () {
      const String email = "kelompok1@gmail.com";
      const String password = "kelompok1";

      const User user = User(
          id: 51,
          name: "kelompok1",
          email: email,
          phone: "123456789",
          role: "user");
      test(
        "should success",
        () async {
          final result = await remoteDataSource.login(
            email: email,
            password: password,
          );
          // because token is random, we can't check token property
          expect(
            [result.id, result.name, result.email, result.phone, result.role],
            [user.id, user.name, user.email, user.phone, user.role],
          );
        },
      );

      test(
        "should throw LoginException when wrong email or password",
        () async {
          try {
            await remoteDataSource.login(
              email: email,
              password: "wrong",
            );
          } on LoginException catch (e) {
            expect(e.message, "Email atau password yang dimasukkan salah");
          }
        },
      );
    },
  );
}
