import 'package:flutter_test/flutter_test.dart';
import 'package:waroengku/data/data_sources/wishlist/remote_data_source.dart';
import 'package:waroengku/domain/entity/wishlist.dart';

void main() {
  WishlistRemoteDataSourceImpl remoteDataSource =
      WishlistRemoteDataSourceImpl();
  test(
    "should return list wishlist",
    () async {
      final result = await remoteDataSource
          .getWishlist("273|3N0HoWW4dp2NghdFNBxqoZ6PL85iyxuFfD3kJex6");
      expect(result, isA<List<Wishlist>>());
    },
  );
}
