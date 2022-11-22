import 'package:dio/dio.dart';
import 'package:waroengku/domain/entity/cart.dart';
import 'package:waroengku/share/const/base_url.dart';
import 'package:waroengku/share/errors/exceptions.dart';

abstract class CartRemoteDataSource {
  Future<List<Cart>> getCart(String token);
  Future<void> createCart(String token, int productId, int quantity);
}

class CartRemoteDataSourceImpl extends CartRemoteDataSource {
  @override
  Future<List<Cart>> getCart(String token) async {
    const String endPoint = "$baseUrl/api/keranjang";
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      List<Cart> listCart = [];
      final response = await dio.get(endPoint);
      final datas = response.data["data"];
      for (int i = 0; i < datas.length; i++) {
        listCart.add(
          Cart(
            id: datas[i]["id"],
            productId: datas[i]["product_id"],
            userId: datas[i]["user_id"],
            quantity: datas[i]["qty"],
          ),
        );
      }
      return listCart;
    } catch (e) {
      throw GetCartException("Gagal Mendapatkan List Cart");
    }
  }

  @override
  Future<void> createCart(
    String token,
    int productId,
    int quantity,
  ) async {
    const String endPoint = "$baseUrl/api/keranjang";
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      final body = {"product_id": productId, "qty": quantity};
      await dio.post(endPoint, data: body);
    } catch (e) {
      throw CreateCartException("Gagal Menambahkan Barang Ke Keranjang");
    }
  }
}
