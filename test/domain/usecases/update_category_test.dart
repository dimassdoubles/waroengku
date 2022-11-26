import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:waroengku/domain/repositories/category_repository.dart';
import 'package:waroengku/domain/usecases/update_category.dart';

class MockCategoryRepository extends Mock implements CategoryRepository {}

void main() {
  MockCategoryRepository repository = MockCategoryRepository();
  UpdateCategory usecase = UpdateCategory(repository);

  test(
    "should call repository.updateCategory",
    () async {
      when(
        () => repository.updateCategory(
            token: "token", id: 1, newName: "newName"),
      ).thenAnswer(
        (invocation) async => const Right(null),
      );

      await usecase(token: "token", id: 1, newName: "newName");
      verify(() =>
          repository.updateCategory(token: "token", id: 1, newName: "newName"));
      verifyNoMoreInteractions(repository);
    },
  );
}
