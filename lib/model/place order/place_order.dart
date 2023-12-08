class PlaceOrder {
  bool? status;
  String? message;
  List<PlaceOrderList>? data;

  PlaceOrder({
    this.status,
    this.message,
    this.data,
  });

  factory PlaceOrder.fromJson(Map<String, dynamic> json) => PlaceOrder(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<PlaceOrderList>.from(
                json["data"]!.map((x) => PlaceOrderList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class PlaceOrderList {
  String? id;
  String? userId;
  String? wasteTypes;
  String? subWaste;
  String? weight;
  String? wasteImg;
  DateTime? reqDate;
  String? address;
  String? orderStatus;
  DateTime? createdAt;

  PlaceOrderList({
    this.id,
    this.userId,
    this.wasteTypes,
    this.subWaste,
    this.weight,
    this.wasteImg,
    this.reqDate,
    this.address,
    this.orderStatus,
    this.createdAt,
  });

  factory PlaceOrderList.fromJson(Map<String, dynamic> json) => PlaceOrderList(
        id: json["id"],
        userId: json["user_id"],
        wasteTypes: json["waste_types"],
        subWaste: json["sub_waste"],
        weight: json["weight"],
        wasteImg: json["waste_img"],
        reqDate:
            json["req_date"] == null ? null : DateTime.parse(json["req_date"]),
        address: json["address"],
        orderStatus: json["order_status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "waste_types": wasteTypes,
        "sub_waste": subWaste,
        "weight": weight,
        "waste_img": wasteImg,
        "req_date":
            "${reqDate!.year.toString().padLeft(4, '0')}-${reqDate!.month.toString().padLeft(2, '0')}-${reqDate!.day.toString().padLeft(2, '0')}",
        "address": address,
        "order_status": orderStatus,
        "created_at": createdAt?.toIso8601String(),
      };
}
