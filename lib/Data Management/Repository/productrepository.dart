import 'package:dio/dio.dart';

import 'package:welcomestoreapp/Data%20Management/Models/products.dart';
import 'package:welcomestoreapp/System%20Management/api.dart';

class ProductRepository {
  final _api = APi();

  Future<List<ProductModel>> fetchAllProducts() async {
    try {
      Response response = await _api.send_Request.get("/Products");

      api_Response apiResponse = api_Response.fromResponse(response);

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      return (apiResponse.data as List<dynamic>)
          .map((json) => ProductModel.fromJson(json))
          .toList();
    } catch (ex) {
      rethrow;
    }
  }

  Future<List<ProductModel>> fetchProductsById(String cateoryID) async {
    try {
      Response response =
          await _api.send_Request.get("/Products/Categories/$cateoryID");

      api_Response apiResponse = api_Response.fromResponse(response);

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      return (apiResponse.data as List<dynamic>)
          .map((json) => ProductModel.fromJson(json))
          .toList();
    } catch (ex) {
      rethrow;
    }
  }
}
