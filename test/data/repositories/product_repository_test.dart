import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:waroengku/data/data_sources/product/remote_data_source.dart';
import 'package:waroengku/data/repositories/product_repository_impl.dart';
import 'package:waroengku/domain/entity/product.dart';
import 'package:waroengku/share/errors/exceptions.dart';
import 'package:waroengku/share/errors/failures.dart';

class MockProductRemoteDataSource extends Mock
    implements ProductRemoteDataSource {}

void main() {
  MockProductRemoteDataSource remoteDataSource = MockProductRemoteDataSource();
  ProductRepositoryImpl repositoryImpl = ProductRepositoryImpl(
    remoteDataSource: remoteDataSource,
  );

  group(
    "getProductByCategory",
    () {
      test(
        "should fail when category id is not found",
        () async {
          when(
            () => remoteDataSource.getProductByCategory(
                token: "token", categoryId: 1),
          ).thenThrow(
            NotFoundException("Id kategori tidak ditemukan"),
          );

          final result = await repositoryImpl.getProductByCategory(
            token: "token",
            categoryId: 1,
          );

          expect(result, Left(NotFoundFailure("Id kategori tidak ditemukan")));
          verify(
            () => remoteDataSource.getProductByCategory(
                token: "token", categoryId: 1),
          );
          verifyNoMoreInteractions(remoteDataSource);
        },
      );

      test(
        "should fail when token is not valid",
        () async {
          when(
            () => remoteDataSource.getProductByCategory(
                token: "token", categoryId: 1),
          ).thenThrow(
            NoAuthorizationException("Token tidak valid"),
          );
          final result = await repositoryImpl.getProductByCategory(
            token: "token",
            categoryId: 1,
          );
          expect(result, Left(NoAuthorizationFailure("Token tidak valid")));
          verify(
            () => remoteDataSource.getProductByCategory(
                token: "token", categoryId: 1),
          );
          verifyNoMoreInteractions(remoteDataSource);
        },
      );

      List<Product> listProduct = [];

      test(
        "should success",
        () async {
          when(
            () => remoteDataSource.getProductByCategory(
                token: "token", categoryId: 1),
          ).thenAnswer(
            (invocation) => Future.value(listProduct),
          );
          final result = await repositoryImpl.getProductByCategory(
            token: "token",
            categoryId: 1,
          );
          expect(result, Right(listProduct));
          verify(
            () => remoteDataSource.getProductByCategory(
              token: "token",
              categoryId: 1,
            ),
          );
          verifyNoMoreInteractions(remoteDataSource);
        },
      );
    },
  );
}
