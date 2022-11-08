import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:waroengku/domain/entity/category.dart';
import 'package:waroengku/domain/repositories/category_repository.dart';
import 'package:waroengku/domain/usecases/get_categories.dart';

class MockCategoryRepository extends Mock implements CategoryRepository {}

void main() {
  MockCategoryRepository repository = MockCategoryRepository();
  GetCategories usecase = GetCategories(repository);

  const List<Category> listCategory = [];

  test(
    "should call repository.getRepositories",
    () async {
      when(
        () => repository.getCategories("token"),
      ).thenAnswer(
        (invocation) async => const Right(listCategory),
      );
      final result = await usecase("token");
      expect(result, const Right(listCategory));
      verify(() => repository.getCategories("token"));
      verifyNoMoreInteractions(repository);
    },
  );
}
