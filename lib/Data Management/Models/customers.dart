class customer_Model {
  String? sId;
  String? email;
  String? password;
  String? fullname;
  String? state;
  String? city;
  String? address;
  String? pincode;
  String? phoneno;
  int? profileprogress;
  String? id;
  String? updatedon;
  String? createdon;

  customer_Model({
    this.sId,
    this.email,
    this.password,
    this.fullname,
    this.state,
    this.city,
    this.address,
    this.pincode,
    this.phoneno,
    this.profileprogress,
    this.id,
    this.updatedon,
    this.createdon,
  });

  customer_Model.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    password = json['password'];
    fullname = json['fullname'];
    state = json['state'];
    city = json['city'];
    address = json['address'];
    pincode = json['pincode'];
    phoneno = json['phoneno'];
    profileprogress = json['profileprogress'];
    id = json['id'];
    updatedon = json['updatedon'];
    createdon = json['createdon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['fullname'] = this.fullname;
    data['state'] = this.state;
    data['city'] = this.city;
    data['address'] = this.address;
    data['pincode'] = this.pincode;
    data['phoneno'] = this.phoneno;
    data['profileprogress'] = this.profileprogress;
    data['id'] = this.id;
    data['updatedon'] = this.updatedon;
    data['createdon'] = this.createdon;
    return data;
  }
}
