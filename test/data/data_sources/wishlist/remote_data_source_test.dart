import 'package:flutter_test/flutter_test.dart';
import 'package:waroengku/data/data_sources/wishlist/remote_data_source.dart';
import 'package:waroengku/domain/entity/wishlist.dart';

import '../../../const/token.dart';

void main() {
  WishlistRemoteDataSourceImpl remoteDataSource =
      WishlistRemoteDataSourceImpl();
  group(
    "getWishlist",
    () {
      test(
        "should return list wishlist",
        () async {
          final result = await remoteDataSource.getWishlist(validUserToken);
          expect(result, isA<List<Wishlist>>());
        },
      );
    },
  );

  group(
    "createWishlist",
    () {
      test(
        "should return void",
        () async {
          try {
            await remoteDataSource.createWishlist(
              validUserToken,
              10,
            );
            expect("success", "success");
          } catch (e) {
            expect("fail", "success");
          }
        },
      );
    },
  );
}
