import 'package:flutter_test/flutter_test.dart';
import 'package:waroengku/data/data_sources/cart/remote_data_source.dart';
import 'package:waroengku/domain/entity/cart.dart';

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
}
