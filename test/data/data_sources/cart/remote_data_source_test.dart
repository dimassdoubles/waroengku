import 'package:flutter_test/flutter_test.dart';
import 'package:waroengku/data/data_sources/cart/remote_data_source.dart';
import 'package:waroengku/domain/entity/cart.dart';
import 'package:waroengku/share/errors/exceptions.dart';

import '../../../const/token.dart';

void main() {
  CartRemoteDataSource remoteDataSource = CartRemoteDataSourceImpl();

  group(
    "getCart",
    () {
      test(
        "should return list cart",
        () async {
          final result = await remoteDataSource.getCart(validUserToken);
          expect(result, isA<List<Cart>>());
        },
      );
    },
  );

  group(
    "createCart",
    () {
      test(
        "should return void",
        () async {
          try {
            await remoteDataSource.createCart(validUserToken, 1, 4);
            expect("success", "success");
          } on CreateCartException catch (e) {
            expect("fail", "fail");
          }
        },
      );
    },
  );

  group(
    "deleteCart",
    () {
      test(
        "should return void",
        () async {
          try {
            await remoteDataSource.deleteCart(validUserToken, 1);
            expect("success", "success");
          } on DeleteCartException {
            expect("fail", "fail");
          }
        },
      );
    },
  );
}
