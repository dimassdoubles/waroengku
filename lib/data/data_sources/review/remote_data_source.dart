import 'dart:io';

import 'package:dio/dio.dart';
import 'package:waroengku/share/const/base_url.dart';
import 'package:waroengku/share/errors/exceptions.dart';

abstract class ReviewRemoteDataSource {
  Future<void> createReview(
    String token,
    int productId,
    int star,
    String review,
    File image,
  );
  Future<void> deleteReview(String token, int id);
}

class ReviewRemoteDataSourceImpl extends ReviewRemoteDataSource {
  @override
  Future<void> createReview(
    String token,
    int productId,
    int star,
    String review,
    File image,
  ) async {
    final String endPoint = "$baseUrl/api/review/$productId";

    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      final formData = FormData.fromMap(
        {
          "star": star,
          "review": review,
          "image": await MultipartFile.fromFile(image.path)
        },
      );
      await dio.post(endPoint, data: formData);
    } catch (e) {
      throw CreateReviewException("Gagal Membuat review");
    }
  }

  @override
  Future<void> deleteReview(String token, int id) async {
    final String endPoint = "$baseUrl/api/review/$id";
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      await dio.delete(endPoint);
    } catch (e) {
      throw DeleteReviewException("Gagal Menghapus Review");
    }
  }
}
