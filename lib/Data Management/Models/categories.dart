class CategoryModel {
  String? sId;
  String? title;
  String? description;
  String? createdon;

  CategoryModel({
    this.sId,
    this.title,
    this.description,
    this.createdon,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    createdon = json['createdon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['createdon'] = this.createdon;
    return data;
  }
}
