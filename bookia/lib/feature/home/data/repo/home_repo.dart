// 1) test api call on postman
// 2) make constants file for api endpoints
// 3) use dio package to make api calls
// 4) use repo to handle api calls
// - use dio and specific api endpoint "$baseUrl/register" and its method "POST" AND CHECK IF the endpoint has body !!
// - check if the "status code" of response is 201 or not
// - if it is 201, parse the response to model and return it

import 'dart:developer';

import 'package:bookia/core/services/remote/endpoints.dart';
import 'package:bookia/feature/home/data/models/products_response/products_response.dart';
import 'package:dio/dio.dart';

// map["data"]["products"][0]["name"]
// obj.data.products[0].name
class HomeRepo {
  static Future<ProductsResponse?> getNewArrivalsBooks() async {
    try {
      var response = await Dio().get(
        AppEndpoints.baseUrl + AppEndpoints.getNewArrivalsBooks,
      );
      if (response.statusCode == 200) {
        return ProductsResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
