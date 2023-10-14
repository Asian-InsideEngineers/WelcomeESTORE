import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:welcomestoreapp/Data%20Management/Models/cartmodel.dart';
import 'package:welcomestoreapp/System%20Management/api.dart';

class CartRepository {
  final _api = APi();

  Future<List<CartItemModel>> fetchAllCartItems(String customers) async {
    try {
      Response response = await _api.send_Request.get("/carts/$customers");

      api_Response apiResponse = api_Response.fromResponse(response);

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      return (apiResponse.data as List<dynamic>)
          .map((json) => CartItemModel.fromJson(json))
          .toList();
    } catch (ex) {
      rethrow;
    }
  }

  Future<List<CartItemModel>> addToCart(
      String userId, CartItemModel cartitems) async {
    try {
      Map<String, dynamic> itemdata = cartitems.toJson();
      itemdata["Customers"] = userId;
      Response response =
          await _api.send_Request.post("/carts", data: jsonEncode(itemdata));

      api_Response apiResponse = api_Response.fromResponse(response);

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      return (apiResponse.data as List<dynamic>)
          .map((json) => CartItemModel.fromJson(json))
          .toList();
    } catch (ex) {
      rethrow;
    }
  }

  Future<List<CartItemModel>> removeFromCart(
      String userId, String prouductId) async {
    try {
      Map<String, dynamic> itemdata = {
        "Customers": userId,
        "Products": prouductId,
      };
      Response response =
          await _api.send_Request.delete("/carts", data: jsonEncode(itemdata));

      api_Response apiResponse = api_Response.fromResponse(response);

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      return (apiResponse.data as List<dynamic>)
          .map((json) => CartItemModel.fromJson(json))
          .toList();
    } catch (ex) {
      rethrow;
    }
  }
}
