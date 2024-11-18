// 1) test api call on postman
// 2) make constants file for api endpoints
// 3) use dio package to make api calls
// 4) use repo to handle api calls
// - use dio and specific api endpoint "$baseUrl/register" and its method "POST" AND CHECK IF the endpoint has body !!
// - check if the "status code" of response is 201 or not
// - if it is 201, parse the response to model and return it

import 'dart:developer';

import 'package:bookia_2/core/services/remote/endpoints.dart';
import 'package:bookia_2/feature/auth/data/models/user_model_response/user_model_response.dart';
import 'package:dio/dio.dart';

// map["data"]["products"][0]["name"]
// obj.data.products[0].name
class AuthRepo {
  static Future<UserModelResponse?> register(
      {required String name,
      required String email,
      required String password,
      required String passwordConfirmation}) async {
    try {
      var response =
          await Dio().post(AppEndpoints.baseUrl + AppEndpoints.register, data: {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation
      });
      if (response.statusCode == 201) {
        return UserModelResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<UserModelResponse?> login({
    required String email,
    required String password,
  }) async {
    try {
      var response =
          await Dio().post(AppEndpoints.baseUrl + AppEndpoints.login, data: {
        "email": email,
        "password": password,
      });
      if (response.statusCode == 200) {
        return UserModelResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
