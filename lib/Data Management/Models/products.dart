class ProductModel {
  bool matchesSearchQuery(String query) {
    return productname?.toLowerCase().contains(query.toLowerCase()) ?? false;
  }

  String? id;
  int? productcode;
  String? productname;
  String? productimage;
  Category? category;
  String? updatedon;
  String? createdon;
  int? v;

  ProductModel(
      {this.id,
      this.productcode,
      this.productname,
      this.productimage,
      this.category,
      this.updatedon,
      this.createdon,
      this.v});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["productcode"] is num) {
      productcode = (json["productcode"] as num).toInt();
    }
    if (json["productname"] is String) {
      productname = json["productname"];
    }
    if (json["productimage"] is String) {
      productimage = json["productimage"];
    }
    if (json["category"] is Map) {
      category =
          json["category"] == null ? null : Category.fromJson(json["category"]);
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
    data["productimage"] = productimage;
    if (category != null) {
      data["category"] = category?.toJson();
    }
    data["updatedon"] = updatedon;
    data["createdon"] = createdon;
    data["__v"] = v;
    return data;
  }
}

class Category {
  String? id;
  String? title;
  String? description;
  String? image;
  String? createdon;
  int? v;

  Category(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.createdon,
      this.v});

  Category.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["image"] is String) {
      image = json["image"];
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
    data["title"] = title;
    data["description"] = description;
    data["image"] = image;
    data["createdon"] = createdon;
    data["__v"] = v;
    return data;
  }
}
