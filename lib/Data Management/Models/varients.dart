class VarientModel {
  String? id;
  String? title;
  String? image;
  String? description;
  int? mrp;
  int? price;
  String? savings;
  Product? product;
  String? updatedon;
  String? createdon;

  VarientModel(
      {this.id,
      this.title,
      this.mrp,
      this.price,
      this.savings,
      this.product,
      this.updatedon,
      this.createdon});

  VarientModel.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["MRP"] is num) {
      mrp = (json["MRP"] as num).toInt();
    }
    if (json["price"] is num) {
      price = (json["price"] as num).toInt();
    }
    if (json["savings"] is String) {
      savings = json["savings"];
    }
    if (json["product"] is Map) {
      product =
          json["product"] == null ? null : Product.fromJson(json["product"]);
    }
    if (json["updatedon"] is String) {
      updatedon = json["updatedon"];
    }
    if (json["createdon"] is String) {
      createdon = json["createdon"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["title"] = title;
    data["image"] = image;
    data["description"] = description;
    data["MRP"] = mrp;
    data["price"] = price;
    data["savings"] = savings;
    if (product != null) {
      data["product"] = product?.toJson();
    }
    data["updatedon"] = updatedon;
    data["createdon"] = createdon;
    return data;
  }
}

class Product {
  String? id;
  int? productcode;
  String? productname;
  String? category;
  String? updatedon;
  String? createdon;
  int? v;

  Product(
      {this.id,
      this.productcode,
      this.productname,
      this.category,
      this.updatedon,
      this.createdon,
      this.v});

  Product.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["productcode"] is num) {
      productcode = (json["productcode"] as num).toInt();
    }
    if (json["productname"] is String) {
      productname = json["productname"];
    }
    if (json["category"] is String) {
      category = json["category"];
    }
    if (json["updatedon"] is String) {
      updatedon = json["updatedon"];
    }
    if (json["createdon"] is String) {
      createdon = json["createdon"];
    }
    if (json["__v"] is num) {
      v = (json["__v"] as num).toInt();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["productcode"] = productcode;
    data["productname"] = productname;
    data["category"] = category;
    data["updatedon"] = updatedon;
    data["createdon"] = createdon;
    data["__v"] = v;
    return data;
  }
}
