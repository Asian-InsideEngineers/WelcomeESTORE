import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String BASE_URL = "http://192.168.91.243:2000/api";

const Map<String, dynamic> DEFAULT_HEADERS = {
  "Content-type": "application/json"
};

class APi {
  final Dio requestmanager = Dio();
  APi() {
    requestmanager.options.baseUrl = BASE_URL;
    requestmanager.options.headers = DEFAULT_HEADERS;
    requestmanager.interceptors.add(PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      request: true,
      error: true,
    ));
  }

  Dio get sendrequest => requestmanager;
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
        success: data["success"], data: data["data"], message: data["message"]);
  }
}
