import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:welcomestoreapp/Data%20Management/Models/cartmodel.dart';
import 'package:welcomestoreapp/System%20Management/api.dart';

class CartRepository {
  final _api = APi();

  Future<List<CartModel>> fetchAllCartItems(String customersId) async {
    try {
      Response response = await _api.sendrequest.get("/carts/$customersId");

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      return (apiResponse.data as List<dynamic>)
          .map((json) => CartModel.fromJson(json))
          .toList();
    } catch (ex) {
      rethrow;
    }
  }

  Future<List<CartModel>> addToCart(
      String customersId, CartModel cartitems) async {
    try {
      Map<String, dynamic> adddata = cartitems.toJson();
      adddata["Customers"] = customersId;
      Response response =
          await _api.sendrequest.post("/carts", data: jsonEncode(adddata));

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      return (apiResponse.data as List<dynamic>)
          .map((json) => CartModel.fromJson(json))
          .toList();
    } catch (ex) {
      rethrow;
    }
  }

  Future<List<CartModel>> removeFromCart(
      String userId, String varientID) async {
    try {
      Map<String, dynamic> removedata = {
        "Customers": userId,
        "cartproducts": varientID,
      };
      Response response =
          await _api.sendrequest.delete("/carts", data: jsonEncode(removedata));

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      return (apiResponse.data as List<dynamic>)
          .map((json) => CartModel.fromJson(json))
          .toList();
    } catch (ex) {
      rethrow;
    }
  }
}
