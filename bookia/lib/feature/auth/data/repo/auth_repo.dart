// 1) test api call on postman
// 2) make constants file for api endpoints
// 3) use dio package to make api calls
// 4) use repo to handle api calls
// - use dio and specific api endpoint "$baseUrl/register" and its method "POST" AND CHECK IF the endpoint has body !!
// - check if the "status code" of response is 201 or not
// - if it is 201, parse the response to model and return it

import 'package:bookia/core/services/remote/endpoints.dart';
import 'package:bookia/feature/auth/data/models/user_model_response/user_model_response.dart';
import 'package:dio/dio.dart';

// map["data"]["products"][0]["name"]
// obj.data.products[0].name
class AuthRepo {
  static Future<UserModelResponse?> register(
      {required String name,
      required String email,
      required String password,
      required String password_confirmation}) async {
    try {
      var response =
          await Dio().post(AppEndpoints.baseUrl + AppEndpoints.register, data: {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": password_confirmation
      });
      if (response.statusCode == 201) {
        print('-----1-----');
        return UserModelResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }
}
