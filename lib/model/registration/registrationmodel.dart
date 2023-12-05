class Registration {
  bool? status;
  String? message;
  Data? data;

  Registration({
    this.status,
    this.message,
    this.data,
  });

  factory Registration.fromJson(Map<String, dynamic> json) => Registration(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  String? userName;
  String? mobile;
  String? email;
  String? fullname;
  String? password;
  String? address1;
  String? city;
  String? pincode;
  String? state;
  String? lattitude;
  String? longitude;
  String? chooseSubCategory;

  Data({
    this.userName,
    this.mobile,
    this.email,
    this.fullname,
    this.password,
    this.address1,
    this.city,
    this.pincode,
    this.state,
    this.lattitude,
    this.longitude,
    this.chooseSubCategory,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userName: json["user_name"],
        mobile: json["mobile"],
        email: json["email"],
        fullname: json["fullname"],
        password: json["password"],
        address1: json["address1"],
        city: json["city"],
        pincode: json["pincode"],
        state: json["state"],
        lattitude: json["lattitude"],
        longitude: json["longitude"],
        chooseSubCategory: json["choose_sub_category"],
      );

  Map<String, dynamic> toJson() => {
        "user_name": userName,
        "mobile": mobile,
        "email": email,
        "fullname": fullname,
        "password": password,
        "address1": address1,
        "city": city,
        "pincode": pincode,
        "state": state,
        "lattitude": lattitude,
        "longitude": longitude,
        "choose_sub_category": chooseSubCategory,
      };
}
