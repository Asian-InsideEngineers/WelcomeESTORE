class CategoryModel {
  String? title;
  String? description;
  String? image;
  String? id;
  String? createdon;
  int? v;

  CategoryModel(
      {this.title,
      this.description,
      this.image,
      this.id,
      this.createdon,
      this.v});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["_id"] is String) {
      id = json["_id"];
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
    data["title"] = title;
    data["description"] = description;
    data["image"] = image;
    data["_id"] = id;
    data["createdon"] = createdon;
    data["__v"] = v;
    return data;
  }
}
