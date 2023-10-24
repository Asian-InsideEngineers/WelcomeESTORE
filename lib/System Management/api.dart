import 'package:dio/dio.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String BASE_URL = "http://192.168.97.243:2000/api";
const Map<String, dynamic> DEFAULT_HEADERS = {
  "Content-type": "application/json"
};

class APi {
  final Dio requestManager = Dio();

  APi() {
    requestManager.options.baseUrl = BASE_URL;
    requestManager.options.headers = DEFAULT_HEADERS;
    requestManager.interceptors.add(PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      request: true,
      error: true,
    ));
  }

  Dio get sendRequest => requestManager;
}

class ApiResponse {
  bool success;
  dynamic data;
  String? message;

  ApiResponse({
    required this.success,
    this.data,
    this.message,
  });

  factory ApiResponse.fromResponse(Response response) {
    final data = response.data as Map<String, dynamic>;

    return ApiResponse(
      success: data["success"],
      data: data["data"],
      message: data["message"],
    );
  }
}
