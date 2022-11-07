import 'package:flutter_test/flutter_test.dart';
import 'package:waroengku/data/data_sources/user/remote_data_source.dart';
import 'package:waroengku/share/errors/exceptions.dart';

void main() {
  late UserRemoteDataSourceImpl remoteDataSource;

  setUp(
    () {
      remoteDataSource = UserRemoteDataSourceImpl();
    },
  );

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
}
