import 'dart:io';

import 'package:dio/dio.dart';
import 'package:waroengku/domain/entity/product.dart';
import 'package:waroengku/domain/entity/review.dart';
import 'package:waroengku/share/const/base_url.dart';
import 'package:waroengku/share/errors/exceptions.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>> getProductByCategory({
    required String token,
    required int categoryId,
  });
  Future<List<Review>> getReviewByProductId({
    required String token,
    required int productId,
  });
  Future<void> deleteProduct(String token, int id);
  Future<void> createProduct(
    String token,
    String name,
    int categoryId,
    File image,
    int stock,
    String description,
    int price,
  );
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

  @override
  Future<List<Review>> getReviewByProductId({
    required String token,
    required int productId,
  }) async {
    final String endPoint = "$baseUrl/api/review/$productId";
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      final response = await dio.get(endPoint);
      final datas = response.data["data"];
      List<Review> listReview = [];
      for (int i = 0; i < datas.length; i++) {
        listReview.add(
          Review(
            id: datas[i]["id"],
            star: datas[i]["star"],
            review: datas[i]["review"],
            image: datas[i]["image"],
            authorName: datas[i]["user"]["name"],
            userId: datas[i]["user_id"],
          ),
        );
      }
      return listReview;
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        throw NotFoundException("Id produk tidak ditemukan");
      } else {
        throw NoAuthorizationException("Token tidak valid");
      }
    }
  }

  @override
  Future<void> deleteProduct(String token, int id) async {
    final String endPoint = "$baseUrl/api/admin/barang/$id";
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      await dio.delete(endPoint);
    } catch (e) {
      throw DeleteProductException("Gagal Menghapus Product");
    }
  }

  @override
  Future<void> createProduct(
    String token,
    String name,
    int categoryId,
    File image,
    int stock,
    String description,
    int price,
  ) async {
    const String endPoint = "$baseUrl/api/admin/barang";
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      final formData = FormData.fromMap(
        {
          "name": name,
          "category_id": categoryId,
          "image": await MultipartFile.fromFile(image.path),
          "stock": stock,
          "deskripsi": description,
          "harga": price,
        },
      );
      await dio.post(endPoint, data: formData);
    } catch (e) {
      throw CreateProductException("Gagal Membuat Product");
    }
  }
}
