import 'package:dio/dio.dart';
import 'package:welcomestoreapp/Data%20Management/Models/categories.dart';
import 'package:welcomestoreapp/System%20Management/api.dart';

class CategoryRepository {
  final _api = APi();

  Future<List<CategoryModel>> fetchAllCategories() async {
    try {
      Response response = await _api.send_Request.get("/Categories");

      api_Response apiResponse = api_Response.fromResponse(response);

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      return (apiResponse.data as List<dynamic>)
          .map((json) => CategoryModel.fromJson(json))
          .toList();
    } catch (ex) {
      rethrow;
    }
  }
}