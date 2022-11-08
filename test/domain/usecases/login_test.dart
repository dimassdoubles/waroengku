import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:waroengku/domain/entity/user.dart';
import 'package:waroengku/domain/repositories/user_repository.dart';
import 'package:waroengku/domain/usecases/login.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockUserRepository repository;
  late Login usecase;

  setUp(
    () {
      repository = MockUserRepository();
      usecase = Login(repository);
    },
  );

  const String email = "email@gmail.com";
  const String password = "password";
  const User user = User(
    id: 1,
    name: "name",
    email: "email",
    phone: "phone",
    role: "role",
    token: "token",
  );

  test(
    "should call repository.login",
    () async {
      when(() => repository.login(email: email, password: password)).thenAnswer(
        (invocation) async =>  const Right(user),
      );

      final result = await usecase(email: email, password: password);
      expect(result,  const Right(user));
      verify(() => repository.login(email: email, password: password));
      verifyNoMoreInteractions(repository);
    },
  );
}
