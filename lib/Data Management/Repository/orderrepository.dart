import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:welcomestoreapp/Data%20Management/Models/ordermodel.dart';
import 'package:welcomestoreapp/System%20Management/api.dart';

class OrderRepository {
  final _api = APi();

  Future<List<OrderModel>> fetchOrdersForCustomers(String customersId) async {
    try {
      Response response = await _api.sendRequest.get("/orders/$customersId");

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      return (apiResponse.data as List<dynamic>)
          .map((json) => OrderModel.fromJson(json))
          .toList();
    } catch (ex) {
      rethrow;
    }
  }

  Future<OrderModel> createorder(OrderModel orderModel) async {
    try {
      Response response = await _api.sendRequest
          .post("/orders", data: jsonEncode(orderModel.toJson()));

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      return OrderModel.fromJson(apiResponse.data);
    } catch (ex) {
      rethrow;
    }
  }
}
