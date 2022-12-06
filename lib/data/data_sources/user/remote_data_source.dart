import 'dart:convert';

import 'package:dio/dio.dart';
import '../../../domain/entity/user.dart';
import '../../../share/const/base_url.dart';
import '../../../share/errors/exceptions.dart';

abstract class UserRemoteDataSource {
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  });
  Future<User> login({required String email, required String password});
  Future<void> logout(String token);
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  @override
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    const String endPoint = "$baseUrl/api/register";
    final body = {
      "name": name,
      "email": email,
      "handphone": phone,
      "password": password,
      "password_confirmation": password,
    };

    try {
      await Dio().post(endPoint, data: body);
    } on DioError catch (e) {
      Map<String, dynamic> errorResponse = jsonDecode(e.response.toString());

      if (errorResponse["code"] == "-1") {
        String errorMessage = "";
        String emailError = "";
        String phoneError = "";
        try {
          emailError = errorResponse["data"]["errors"]["email"][0];
          // ignore: empty_catches
        } catch (e) {}

        try {
          phoneError = errorResponse["data"]["errors"]["handphone"][0];
          // ignore: empty_catches
        } catch (e) {}

        if (emailError == "") {
          errorMessage = phoneError;
        } else {
          if (phoneError != "") {
            errorMessage = "${emailError.replaceAll(".", "")} and $phoneError";
          } else {
            errorMessage = emailError;
          }
        }

        throw RegisterException(errorMessage);
      }
    }
  }

  @override
  Future<User> login({
    required String email,
    required String password,
  }) async {
    const String endPoint = "$baseUrl/api/login";
    final body = {
      "email": email,
      "password": password,
    };

    try {
      final response = await Dio().post(endPoint, data: body);
      final user = User(
        id: response.data["data"]["user"]["id"],
        name: response.data["data"]["user"]["name"],
        email: response.data["data"]["user"]["email"],
        phone: response.data["data"]["user"]["handphone"],
        role: response.data["data"]["user"]["role"],
        token: response.data["data"]["token"],
      );
      return user;
    } on DioError catch (e) {
      throw LoginException(e.response!.data["info"]);
    } catch (e) {
      throw LazyException();
    }
  }

  @override
  Future<void> logout(String token) async {
    const String endPoint = "$baseUrl/api/logout";
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      await dio.post(endPoint);
    } on DioError {
      throw LogoutException("Gagal Logout");
    }
  }
}
