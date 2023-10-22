import 'package:welcomestoreapp/Data%20Management/Models/varients.dart';

class CartModel {
  VarientModel? varients;
  int? quantity;
  String? id;

  CartModel({this.quantity, this.id, required this.varients});

  CartModel.fromJson(Map<String, dynamic> json) {
    varients = json["varients"] != null
        ? VarientModel.fromJson(json["varients"])
        : null;
    quantity = json["quantity"] != null && json["quantity"] is num
        ? (json["quantity"] as num).toInt()
        : null;
    id = json["_id"] != null && json["_id"] is String ? json["_id"] : null;
  }

  Map<String, dynamic> toJson({bool objectmode = false}) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["quantity"] = quantity;
    data["varients"] =
        (objectmode == false) ? varients!.id : varients!.toJson();
    data["_id"] = id;
    return data;
  }
}
