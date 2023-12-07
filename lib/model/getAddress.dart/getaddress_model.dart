class GetAddress {
  bool? status;
  String? message;
  List<GetAddressList>? data;

  GetAddress({
    this.status,
    this.message,
    this.data,
  });

  factory GetAddress.fromJson(Map<String, dynamic> json) => GetAddress(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<GetAddressList>.from(
                json["data"]!.map((x) => GetAddressList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class GetAddressList {
  String? id;
  String? name;
  String? userId;
  String? address;
  String? state;
  String? city;
  String? pincode;
  String? area;
  String? mobile;
  DateTime? createdAt;

  GetAddressList({
    this.id,
    this.name,
    this.userId,
    this.address,
    this.state,
    this.city,
    this.pincode,
    this.area,
    this.mobile,
    this.createdAt,
  });

  factory GetAddressList.fromJson(Map<String, dynamic> json) => GetAddressList(
        id: json["id"],
        name: json["name"],
        userId: json["user_id"],
        address: json["address"],
        state: json["state"],
        city: json["city"],
        pincode: json["pincode"],
        area: json["area"],
        mobile: json["mobile"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "user_id": userId,
        "address": address,
        "state": state,
        "city": city,
        "pincode": pincode,
        "area": area,
        "mobile": mobile,
        "created_at": createdAt?.toIso8601String(),
      };
}






// class GetAddress {
//   bool? status;
//   String? message;
//   List<GetAddressList>? data;

//   GetAddress({
//     this.status,
//     this.message,
//     this.data,
//   });

//   factory GetAddress.fromJson(Map<String, dynamic> json) => GetAddress(
//         status: json["status"],
//         message: json["message"],
//         data: json["data"] == null
//             ? []
//             : List<GetAddressList>.from(
//                 json["data"]!.map((x) => GetAddressList.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "data": data == null
//             ? []
//             : List<dynamic>.from(data!.map((x) => x.toJson())),
//       };
// }

// class GetAddressList {
//   String? id;
//   String? userId;
//   String? address;
//   String? state;
//   String? city;
//   String? pincode;
//   String? area;
//   String? mobile;
//   DateTime? createdAt;
//   String? userName;
//   String? fullname;

//   GetAddressList({
//     this.id,
//     this.userId,
//     this.address,
//     this.state,
//     this.city,
//     this.pincode,
//     this.area,
//     this.mobile,
//     this.createdAt,
//     this.userName,
//     this.fullname,
//   });

//   factory GetAddressList.fromJson(Map<String, dynamic> json) => GetAddressList(
//         id: json["id"],
//         userId: json["user_id"],
//         address: json["address"],
//         state: json["state"],
//         city: json["city"],
//         pincode: json["pincode"],
//         area: json["area"],
//         mobile: json["mobile"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         userName: json["user_name"],
//         fullname: json["fullname"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "user_id": userId,
//         "address": address,
//         "state": state,
//         "city": city,
//         "pincode": pincode,
//         "area": area,
//         "mobile": mobile,
//         "created_at": createdAt?.toIso8601String(),
//         "user_name": userName,
//         "fullname": fullname,
//       };
// }
