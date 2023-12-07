class PickUpcategory {
  bool? status;
  String? message;
  List<PickupCategoryList>? data;

  PickUpcategory({
    this.status,
    this.message,
    this.data,
  });

  factory PickUpcategory.fromJson(Map<String, dynamic> json) => PickUpcategory(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<PickupCategoryList>.from(
                json["data"]!.map((x) => PickupCategoryList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class PickupCategoryList {
  String? id;
  String? wasteName;
  String? wasteDesc;
  DateTime? createdAt;

  PickupCategoryList({
    this.id,
    this.wasteName,
    this.wasteDesc,
    this.createdAt,
  });

  factory PickupCategoryList.fromJson(Map<String, dynamic> json) =>
      PickupCategoryList(
        id: json["id"],
        wasteName: json["waste_name"],
        wasteDesc: json["waste_desc"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "waste_name": wasteName,
        "waste_desc": wasteDesc,
        "created_at": createdAt?.toIso8601String(),
      };
}
