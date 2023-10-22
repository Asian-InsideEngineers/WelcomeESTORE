import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:welcomestoreapp/Data%20Management/Models/customers.dart';
import 'package:welcomestoreapp/System%20Management/api.dart';

class CustomerRepository {
  final _api = APi();

  Future<CustomerModel> createAccount({
    required String email,
    required String password,
  }) async {
    try {
      Response response =
          await _api.sendrequest.post("/Customers/createAccount",
              data: jsonEncode({
                "email": email,
                "password": password,
              }));

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      return CustomerModel.fromJson(apiResponse.data);
    } catch (ex) {
      rethrow;
    }
  }

  Future<CustomerModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await _api.sendrequest.post("/Customers/signIn",
          data: jsonEncode({
            "email": email,
            "password": password,
          }));

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      return CustomerModel.fromJson(apiResponse.data);
    } catch (ex) {
      rethrow;
    }
  }

  Future<CustomerModel> updateuser(CustomerModel customerModel) async {
    try {
      Response response = await _api.sendrequest.put(
          "/Customers/${customerModel.id}",
          data: jsonEncode(customerModel.toJson()));

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      return CustomerModel.fromJson(apiResponse.data);
    } catch (ex) {
      rethrow;
    }
  }
}
