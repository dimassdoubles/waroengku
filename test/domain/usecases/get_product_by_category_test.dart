import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:waroengku/domain/entity/product.dart';
import 'package:waroengku/domain/repositories/product_repository.dart';
import 'package:waroengku/domain/usecases/get_product_by_category.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  MockProductRepository repository = MockProductRepository();
  GetProductByCategory usecase = GetProductByCategory(repository);

  List<Product> listProduct = [];

  test(
    "should call repository.getProductByCategory",
    () async {
      when(
        () => repository.getProductByCategory(
          token: "token",
          categoryId: 1,
        ),
      ).thenAnswer(
        (invocation) async => Right(listProduct),
      );

      await usecase(token: "token", categoryId: 1);
      verify(
        () => repository.getProductByCategory(token: "token", categoryId: 1),
      );
      verifyNoMoreInteractions(repository);
    },
  );
}
