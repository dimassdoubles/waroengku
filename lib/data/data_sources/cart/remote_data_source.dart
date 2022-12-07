import 'package:dio/dio.dart';
import 'package:waroengku/domain/entity/cart.dart';
import 'package:waroengku/domain/entity/product.dart';
import 'package:waroengku/share/const/base_url.dart';
import 'package:waroengku/share/errors/exceptions.dart';

abstract class CartRemoteDataSource {
  Future<List<Cart>> getCart(String token);
  Future<void> createCart(String token, int productId, int quantity);
  Future<void> deleteCart(String token, int id);
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
            product: Product(
              id: datas[i]["product"]["id"],
              categoryId: datas[i]["product"]["category_id"],
              description: datas[i]["product"]["deskripsi"],
              image: datas[i]["product"]["image"],
              name: datas[i]["product"]["name"],
              price: datas[i]["product"]["harga"],
              stock: datas[i]["product"]["stock"],
            ),
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

  @override
  Future<void> deleteCart(String token, int id) async {
    final String endPoint = "$baseUrl/api/keranjang/$id";
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      await dio.delete(endPoint);
    } catch (e) {
      throw DeleteCartException("Gagal Menghapus Barang Dari Keranjang");
    }
  }
}
