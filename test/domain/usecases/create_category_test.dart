import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:waroengku/domain/repositories/category_repository.dart';
import 'package:waroengku/domain/usecases/create_category.dart';

class MockCategoryRepository extends Mock implements CategoryRepository {}

void main() {
  MockCategoryRepository repository = MockCategoryRepository();
  CreateCategory usecase = CreateCategory(repository);

  test(
    "should call repository.createCategory",
    () async {
      when(
        () => repository.createCategory(token: "token", name: "name"),
      ).thenAnswer(
        (invocation) async => const Right(null),
      );

      await usecase(token: "token", name: "name");
      verify(() => repository.createCategory(token: "token", name: "name"));
      verifyNoMoreInteractions(repository);
    },
  );
}
