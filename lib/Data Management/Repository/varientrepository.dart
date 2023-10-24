import 'package:dio/dio.dart';

import 'package:welcomestoreapp/Data%20Management/Models/varients.dart';

import '../../System Management/api.dart';

class VarientRepository {
  final _api = APi();

  Future<List<VarientModel>> fetchAllVarients() async {
    try {
      Response response = (await _api.sendRequest.get("/varients"));

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      return (apiResponse.data as List<dynamic>)
          .map((json) => VarientModel.fromJson(json))
          .toList();
    } catch (ex) {
      rethrow;
    }
  }

  Future<List<VarientModel>> fetchvarientbyid(String productId) async {
    try {
      Response response =
          await _api.sendRequest.get("/varients/Products/$productId");

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      return (apiResponse.data as List<dynamic>)
          .map((json) => VarientModel.fromJson(json))
          .toList();
    } catch (ex) {
      rethrow;
    }
  }
}
