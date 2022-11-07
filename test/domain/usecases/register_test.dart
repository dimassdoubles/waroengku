import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:waroengku/domain/repositories/user_repository.dart';
import 'package:waroengku/domain/usecases/register.dart';
import 'package:waroengku/share/errors/failures.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockUserRepository repository;
  late Register usecase;

  setUp(
    () {
      repository = MockUserRepository();
      usecase = Register(repository);
    },
  );

  String name = "name";
  String email = "email";
  String phone = "phone";
  String password = "password";

  test(
    "should call repository.register",
    () async {
      when(
        () => repository.register(
          name: name,
          email: email,
          phone: phone,
          password: password,
        ),
      ).thenAnswer(
        (invocation) async => Left(
          RegisterFailure("gagal register"),
        ),
      );

      final result = await usecase(
        name: name,
        email: email,
        phone: phone,
        password: password,
      );

      expect(
        result,
        Left(
          RegisterFailure("gagal register"),
        ),
      );

      verify(
        () => repository.register(
          name: name,
          email: email,
          phone: phone,
          password: password,
        ),
      );
      verifyNoMoreInteractions(repository);
    },
  );
}
