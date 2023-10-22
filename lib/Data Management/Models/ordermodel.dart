import 'package:welcomestoreapp/Data%20Management/Models/cartmodel.dart';

import 'package:welcomestoreapp/Data%20Management/Models/customers.dart';

class OrderModel {
  CustomerModel? Customers;
  List<CartModel>? items;
  String? status;
  DateTime? updatedon;
  DateTime? createdon;

  OrderModel(
      {this.status,
      this.updatedon,
      this.createdon,
      this.Customers,
      this.items});

  OrderModel.fromJson(Map<String, dynamic> json) {
    status = json["status"] as String?;
    Customers = json["Customers"] != null
        ? CustomerModel.fromJson(json["Customers"])
        : null;
    if (json["items"] != null && json["items"] is List) {
      items = (json["items"] as List<dynamic>)
          .map((items) => CartModel.fromJson(items))
          .toList();
    }
    updatedon =
        json["updatedon"] != null ? DateTime.tryParse(json["updatedon"]) : null;
    createdon =
        json["createdon"] != null ? DateTime.tryParse(json["createdon"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = status;
    data["Customers"] = Customers!.toJson();
    data["items"] =
        items!.map((items) => items.toJson(objectmode: true)).toList();
    data["updatedon"] = updatedon?.toIso8601String();
    data["createdon"] = createdon?.toIso8601String();
    return data;
  }
}
