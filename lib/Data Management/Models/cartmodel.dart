import 'package:welcomestoreapp/Data%20Management/Models/products.dart';

class CartItemModel {
  ProductModel? products;
  int? quantity;
  String? sId;
  CartItemModel({this.quantity, this.sId, this.products});

  CartItemModel.fromJson(Map<String, dynamic> json) {
    products = ProductModel.fromJson(json["Products"]);
    quantity = json['Quantity'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Products'] = this.products!.sId;
    data['Quantity'] = this.quantity;
    data['_id'] = this.sId;
    return data;
  }
}
