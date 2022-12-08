import 'package:dio/dio.dart';
import '../../../domain/entity/product.dart';
import '../../../domain/entity/wishlist.dart';
import '../../../share/errors/exceptions.dart';

import '../../../share/const/base_url.dart';

abstract class WishlistRemoteDataSource {
  Future<List<Wishlist>> getWishlist(String token);
  Future<void> createWishlist(String token, int productId);
  Future<void> deleteWishlist(String token, int id);
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
          product: Product(
            id: datas[i]["product_id"],
            categoryId: datas[i]["product"]["category_id"],
            description: datas[i]["product"]["deskripsi"],
            image: datas[i]["product"]["image"],
            name: datas[i]["product"]["name"],
            price: datas[i]["product"]["harga"],
            stock: datas[i]["product"]["stock"],
          ),
          userId: datas[i]["user_id"],
        );
        listWishlist.add(wishlist);
      }

      return listWishlist;
    } catch (e) {
      throw GetWishlistException("Gagal mengambil wishlist");
    }
  }

  @override
  Future<void> createWishlist(String token, int productId) async {
    const String endPoint = "$baseUrl/api/wishlist";
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      final body = {
        "product_id": productId,
      };
      await dio.post(endPoint, data: body);
    } catch (e) {
      throw CreateWishlistException("Gagal menambah wishlist");
    }
  }

  @override
  Future<void> deleteWishlist(String token, int id) async {
    String endPoint = "$baseUrl/api/wishlist/$id";

    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      await dio.delete(endPoint);
    } catch (e) {
      throw DeleteWishlistException("Gagal Menghapus Wishlist");
    }
  }
}
