import 'package:dio/dio.dart';

import '../../../domain/entity/category.dart';
import '../../../share/const/base_url.dart';
import '../../../share/errors/exceptions.dart';

abstract class CategoryRemoteDataSource {
  Future<List<Category>> getCategories(String token);
}

class CategoryRemoteDataSourceImpl extends CategoryRemoteDataSource {
  @override
  Future<List<Category>> getCategories(String token) async {
    const String endPoint = "$baseUrl/api/category";

    try {
      List<Category> listCategory = [];
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      final response = await dio.get(endPoint);
      final datas = response.data["data"];
      for (int i = 0; i < datas.length; i++) {
        Category category = Category(
          id: datas[i]["id"],
          name: datas[i]["name"],
        );
        listCategory.add(category);
      }
      return listCategory;
    } on DioError {
      throw (GetCategoriesException("Gagal mendapatkan list category"));
    }
  }
}
