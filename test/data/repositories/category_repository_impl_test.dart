import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:waroengku/data/data_sources/category/remote_data_source.dart';
import 'package:waroengku/data/repositories/category_repository_impl.dart';
import 'package:waroengku/domain/entity/category.dart';

class MockCategoryRemoteDataSource extends Mock
    implements CategoryRemoteDataSource {}

void main() {
  MockCategoryRemoteDataSource remoteDataSource =
      MockCategoryRemoteDataSource();
  CategoryRepositoryImpl repositoryImpl = CategoryRepositoryImpl(
    remoteDataSource: remoteDataSource,
  );

  group(
    "getCategories",
    () {
      const List<Category> listCategory = [];
      test(
        "should return List Category when success",
        () async {
          when(
            () => remoteDataSource.getCategories("token"),
          ).thenAnswer(
            (invocation) async => listCategory,
          );
          final result = await repositoryImpl.getCategories("token");
          expect(result, const Right(listCategory));
          verify(() => remoteDataSource.getCategories("token"));
          verifyNoMoreInteractions(remoteDataSource);
        },
      );
    },
  );
}
