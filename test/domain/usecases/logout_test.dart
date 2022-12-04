import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:waroengku/domain/repositories/user_repository.dart';
import 'package:waroengku/domain/usecases/logout.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  MockUserRepository repository = MockUserRepository();
  Logout usecase = Logout(repository);

  test(
    "should call repository.logout",
    () async {
      when(
        () => repository.logout("token"),
      ).thenAnswer(
        (invocation) async => const Right(null),
      );

      final result = await usecase("token");
      expect(result, const Right(null));
    },
  );
}
