class ProductModel {
  List<String>? varients;
  String? sId;
  String? productcode;
  String? category;
  String? title;
  int? mRP;
  String? savings;
  int? price;
  String? description;
  String? updatedon;
  String? createdon;
  int? iV;

  ProductModel(
      {this.varients,
      this.sId,
      this.productcode,
      this.category,
      this.title,
      this.mRP,
      this.savings,
      this.price,
      this.description,
      this.updatedon,
      this.createdon,
      this.iV});

  ProductModel.fromJson(Map<String, dynamic> json) {
    varients = json['varients'].cast<String>();
    sId = json['_id'];
    productcode = json['productcode'];
    category = json['category'];
    title = json['title'];
    mRP = json['MRP'];
    savings = json['Savings'];
    price = json['Price'];
    description = json['description'];
    updatedon = json['updatedon'];
    createdon = json['createdon'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['varients'] = this.varients;
    data['_id'] = this.sId;
    data['productcode'] = this.productcode;
    data['category'] = this.category;
    data['title'] = this.title;
    data['MRP'] = this.mRP;
    data['Savings'] = this.savings;
    data['Price'] = this.price;
    data['description'] = this.description;
    data['updatedon'] = this.updatedon;
    data['createdon'] = this.createdon;
    data['__v'] = this.iV;
    return data;
  }
}
