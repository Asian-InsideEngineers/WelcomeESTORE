class CustomerModel {
  String? id;
  String? email;
  String? password;
  String? fullname;
  String? state;
  String? city;
  String? address;
  int? pincode;
  int? phoneno;
  String? updatedon;
  String? createdon;

  CustomerModel(
      {this.id,
      this.email,
      this.password,
      this.fullname,
      this.state,
      this.city,
      this.address,
      this.pincode,
      this.phoneno,
      this.updatedon,
      this.createdon});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["password"] is String) {
      password = json["password"];
    }
    if (json["fullname"] is String) {
      fullname = json["fullname"];
    }
    if (json["state"] is String) {
      state = json["state"];
    }
    if (json["city"] is String) {
      city = json["city"];
    }
    if (json["address"] is String) {
      address = json["address"];
    }

    if (json["phoneno"] is int) {
      phoneno = json["phoneno"];
    }
    if (json["pincode"] is int) {
      pincode = json["pincode"];
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
    data["email"] = email;
    data["password"] = password;
    data["fullname"] = fullname;
    data["state"] = state;
    data["city"] = city;
    data["address"] = address;
    data["pincode"] = pincode;
    data["phoneno"] = phoneno;
    data["updatedon"] = updatedon;
    data["createdon"] = createdon;
    return data;
  }
}
