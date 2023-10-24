import 'package:dio/dio.dart';
import 'package:welcomestoreapp/Data%20Management/Models/categories.dart';
import 'package:welcomestoreapp/System%20Management/api.dart';

class CategoryRepository {
  final _api = APi();

  Future<List<CategoryModel>> fetchAllCategories() async {
    try {
      Response response = await _api.sendRequest.get("/Categories");

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

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
