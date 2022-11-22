import 'package:dio/dio.dart';
import 'package:waroengku/domain/entity/wishlist.dart';
import 'package:waroengku/share/errors/exceptions.dart';

import '../../../share/const/base_url.dart';

abstract class WishlistRemoteDataSource {
  Future<List<Wishlist>> getWishlist(String token);
}

class WishlistRemoteDataSourceImpl extends WishlistRemoteDataSource {
  @override
  Future<List<Wishlist>> getWishlist(String token) async {
    try {
      String endPoint = "$baseUrl/api/wishlist";
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      final response = await dio.get(endPoint);
      final datas = response.data["data"];
      List<Wishlist> listWishlist = [];
      for (int i = 0; i < datas.length; i++) {
        Wishlist wishlist = Wishlist(
          id: datas[i]["id"],
          productId: datas[i]["product_id"],
          userId: datas[i]["user_id"],
        );
        listWishlist.add(wishlist);
      }

      return listWishlist;
    } catch (e) {
      print(e);
      throw GetWishlistException("Gagal mengambil wishlist");
    }
  }
}
