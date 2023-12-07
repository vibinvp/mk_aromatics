class History {
  bool? status;
  String? message;
  List<HistoryList>? data;

  History({
    this.status,
    this.message,
    this.data,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<HistoryList>.from(
                json["data"]!.map((x) => HistoryList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class HistoryList {
  String? id;
  String? userId;
  String? wasteTypes;
  String? subWaste;
  String? weight;
  String? wasteImg;
  String? reqDate;
  String? address;
  String? orderStatus;
  String? createdAt;

  HistoryList({
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

  factory HistoryList.fromJson(Map<String, dynamic> json) => HistoryList(
        id: json["id"],
        userId: json["user_id"],
        wasteTypes: json["waste_types"],
        subWaste: json["sub_waste"],
        weight: json["weight"],
        wasteImg: json["waste_img"],
        reqDate: json["req_date"],
        address: json["address"],
        orderStatus: json["order_status"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "waste_types": wasteTypes,
        "sub_waste": subWaste,
        "weight": weight,
        "waste_img": wasteImg,
        "req_date": reqDate,
        "address": address,
        "order_status": orderStatus,
        "created_at": createdAt,
      };
}
