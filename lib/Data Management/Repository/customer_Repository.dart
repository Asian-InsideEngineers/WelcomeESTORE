import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:welcomestoreapp/Data%20Management/Models/customers.dart';
import 'package:welcomestoreapp/System%20Management/api.dart';

class customer_Repository {
  final _api = APi();

  Future<customer_Model> createAccount({
    required String email,
    required String password,
  }) async {
    try {
      Response response =
          await _api.send_Request.post("/Customers/createAccount",
              data: jsonEncode({
                "email": email,
                "password": password,
              }));

      api_Response apiResponse = api_Response.fromResponse(response);

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      return customer_Model.fromJson(apiResponse.data);
    } catch (ex) {
      rethrow;
    }
  }

  Future<customer_Model> signIn({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await _api.send_Request.post("/Customers/signIn",
          data: jsonEncode({
            "email": email,
            "password": password,
          }));

      api_Response apiResponse = api_Response.fromResponse(response);

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      return customer_Model.fromJson(apiResponse.data);
    } catch (ex) {
      rethrow;
    }
  }
}
