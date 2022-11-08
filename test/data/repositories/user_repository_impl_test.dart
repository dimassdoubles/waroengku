import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:waroengku/data/data_sources/user/remote_data_source.dart';
import 'package:waroengku/data/repositories/user_repository_impl.dart';
import 'package:waroengku/domain/entity/user.dart';
import 'package:waroengku/share/errors/exceptions.dart';
import 'package:waroengku/share/errors/failures.dart';

class MockRemoteUserDataSource extends Mock implements UserRemoteDataSource {}

void main() {
  late MockRemoteUserDataSource remoteDataSource = MockRemoteUserDataSource();
  late UserRepositoryImpl repository =
      UserRepositoryImpl(remoteDataSource: remoteDataSource);

  group(
    "register",
    () {
      const String name = "name";
      const String email = "email@gmail.com";
      const String phone = "0123";
      const String password = "password";

      test(
        "should return void when success",
        () async {
          when(() => remoteDataSource.register(
              name: name,
              email: email,
              password: password,
              phone: phone)).thenAnswer(
            // ignore: avoid_returning_null_for_void
            (invocation) async => null,
          );

          final result = await repository.register(
            name: name,
            email: email,
            phone: phone,
            password: password,
          );

          expect(result, const Right(null));
          verify(
            () => remoteDataSource.register(
              name: name,
              email: email,
              password: password,
              phone: phone,
            ),
          );
          verifyNoMoreInteractions(remoteDataSource);
        },
      );

      test(
        "should return RegisterFailure when error",
        () async {
          when(() => remoteDataSource.register(
              name: name,
              email: email,
              password: password,
              phone: phone)).thenThrow(
            RegisterException("Gagal Register"),
          );
          final result = await repository.register(
            name: name,
            email: email,
            phone: phone,
            password: password,
          );

          expect(result, Left(RegisterFailure("Gagal Register")));
          verify(
            () => remoteDataSource.register(
              name: name,
              email: email,
              password: password,
              phone: phone,
            ),
          );
          verifyNoMoreInteractions(remoteDataSource);
        },
      );
    },
  );

  group(
    "login",
    () {
      const User expectedUser = User(
          id: 12, name: "name", email: "email", phone: "phone", role: "role");
      const String email = "email";
      const String password = "password";

      test(
        "should return user when success",
        () async {
          when(
            () => remoteDataSource.login(email: email, password: password),
          ).thenAnswer(
            (invocation) async => expectedUser,
          );

          final result = await repository.login(
            email: email,
            password: password,
          );

          expect(result, const Right(expectedUser));
          verify(
            () => remoteDataSource.login(email: email, password: password),
          );
          verifyNoMoreInteractions(remoteDataSource);
        },
      );
      test(
        "should return LoginFailure when error",
        () async {
          when(
            () => remoteDataSource.login(email: email, password: password),
          ).thenThrow(
            LoginException("Gagal Login"),
          );
          final result = await repository.login(
            email: email,
            password: password,
          );

          expect(result, Left(LoginFailure("Gagal Login")));
          verify(
            () => remoteDataSource.login(email: email, password: password),
          );
          verifyNoMoreInteractions(remoteDataSource);
        },
      );
    },
  );
}
