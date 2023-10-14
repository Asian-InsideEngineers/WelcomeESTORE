import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String main_URL = "http://192.168.214.243:2000/api";

const Map<String, dynamic> default_Headers = {
  "Content-type": "application/json"
};

class APi {
  final Dio request_manager = Dio();

  APi() {
    request_manager.options.baseUrl = main_URL;
    request_manager.options.headers = default_Headers;
    request_manager.interceptors.add(PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      request: true,
      error: true,
    ));
  }

  Dio get send_Request => request_manager;
}

class api_Response {
  bool success;
  dynamic data;
  String? message;

  api_Response({
    required this.success,
    this.data,
    this.message,
  });

  factory api_Response.fromResponse(Response response) {
    final data = response.data as Map<String, dynamic>;

    return api_Response(
        success: data["success"], data: data["data"], message: data["message"]);
  }
}
