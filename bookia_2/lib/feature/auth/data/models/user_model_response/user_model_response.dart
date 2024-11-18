import 'data.dart';

class UserModelResponse {
  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  UserModelResponse({this.data, this.message, this.error, this.status});

  factory UserModelResponse.fromJson(Map<String, dynamic> json) {
    return UserModelResponse(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      error: json['error'] as List<dynamic>?,
      status: json['status'] as int?,
    );
  }
}
