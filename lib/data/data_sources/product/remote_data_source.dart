import 'package:dio/dio.dart';
import 'package:waroengku/domain/entity/product.dart';
import 'package:waroengku/share/const/base_url.dart';
import 'package:waroengku/share/errors/exceptions.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>> getProductByCategory({
    required String token,
    required int categoryId,
  });
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  @override
  Future<List<Product>> getProductByCategory({
    required String token,
    required int categoryId,
  }) async {
    String endPoint = "$baseUrl/api/category/$categoryId";

    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      final response = await dio.get(endPoint);
      final products = response.data["data"]["products"];
      List<Product> listProduct = [];
      for (int i = 0; i < products.length; i++) {
        listProduct.add(
          Product(
            id: products[i]["id"],
            categoryId: categoryId,
            price: products[i]["harga"],
            stock: products[i]["stock"],
            name: products[i]["name"],
            image: products[i]["image"],
            description: products[i]["deskripsi"],
          ),
        );
      }
      return listProduct;
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        throw NotFoundException("Id kategori tidak terdaftar");
      } else {
        throw NoAuthorizationException("Bearer token tidak valid");
      }
    }
  }
}
