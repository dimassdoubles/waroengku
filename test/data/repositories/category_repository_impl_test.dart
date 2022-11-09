import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:waroengku/data/data_sources/category/remote_data_source.dart';
import 'package:waroengku/data/repositories/category_repository_impl.dart';
import 'package:waroengku/domain/entity/category.dart';
import 'package:waroengku/share/errors/exceptions.dart';
import 'package:waroengku/share/errors/failures.dart';

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

  group(
    "createCategory",
    () {
      test(
        "should fail when user role is not admin",
        () async {
          when(
            () => remoteDataSource.createCategory(token: "token", name: "name"),
          ).thenThrow(
            NoAuthorizationException(
                "Hanya admin yang boleh membuat kategori baru"),
          );
          final result =
              await repositoryImpl.createCategory(token: "token", name: "name");
          expect(
            result,
            Left(
              NoAuthorizationFailure(
                  "Hanya admin yang boleh membuat kategori baru"),
            ),
          );
        },
      );

      test(
        "should success",
        () async {
          when(
            () => remoteDataSource.createCategory(token: "token", name: "name"),
          ).thenAnswer(
            (invocation) => Future.value(null),
          );
          final result = await repositoryImpl.createCategory(
            token: "token",
            name: "name",
          );
          expect(result, const Right(null));
          verify(
            () => remoteDataSource.createCategory(token: "token", name: "name"),
          );
          verifyNoMoreInteractions(remoteDataSource);
        },
      );
    },
  );
}
