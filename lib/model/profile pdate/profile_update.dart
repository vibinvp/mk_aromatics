class UpdateProfile {
  bool? status;
  String? message;
  List<UpdateprofileList>? data;

  UpdateProfile({
    this.status,
    this.message,
    this.data,
  });

  factory UpdateProfile.fromJson(Map<String, dynamic> json) => UpdateProfile(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<UpdateprofileList>.from(
                json["data"]!.map((x) => UpdateprofileList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class UpdateprofileList {
  String? userId;
  String? userName;
  String? password;
  String? fullname;
  String? pp;
  String? address1;
  String? address2;
  String? city;
  String? pincode;
  String? state;
  String? country;
  String? mobile;
  String? email;
  String? sessionId;
  String? fcmKey;
  String? dob;
  String? sex;
  String? lattitude;
  String? longitude;
  String? chooseSubCategory;
  DateTime? joinedDate;

  UpdateprofileList({
    this.userId,
    this.userName,
    this.password,
    this.fullname,
    this.pp,
    this.address1,
    this.address2,
    this.city,
    this.pincode,
    this.state,
    this.country,
    this.mobile,
    this.email,
    this.sessionId,
    this.fcmKey,
    this.dob,
    this.sex,
    this.lattitude,
    this.longitude,
    this.chooseSubCategory,
    this.joinedDate,
  });

  factory UpdateprofileList.fromJson(Map<String, dynamic> json) =>
      UpdateprofileList(
        userId: json["user_id"],
        userName: json["user_name"],
        password: json["password"],
        fullname: json["fullname"],
        pp: json["pp"],
        address1: json["address1"],
        address2: json["address2"],
        city: json["city"],
        pincode: json["pincode"],
        state: json["state"],
        country: json["country"],
        mobile: json["mobile"],
        email: json["email"],
        sessionId: json["session_id"],
        fcmKey: json["fcm_key"],
        dob: json["dob"],
        sex: json["sex"],
        lattitude: json["lattitude"],
        longitude: json["longitude"],
        chooseSubCategory: json["choose_sub_category"],
        joinedDate: json["joined_date"] == null
            ? null
            : DateTime.parse(json["joined_date"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_name": userName,
        "password": password,
        "fullname": fullname,
        "pp": pp,
        "address1": address1,
        "address2": address2,
        "city": city,
        "pincode": pincode,
        "state": state,
        "country": country,
        "mobile": mobile,
        "email": email,
        "session_id": sessionId,
        "fcm_key": fcmKey,
        "dob": dob,
        "sex": sex,
        "lattitude": lattitude,
        "longitude": longitude,
        "choose_sub_category": chooseSubCategory,
        "joined_date": joinedDate?.toIso8601String(),
      };
}
