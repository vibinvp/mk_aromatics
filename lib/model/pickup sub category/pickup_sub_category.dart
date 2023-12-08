class PickUpSubcategory {
  bool? status;
  String? message;
  List<PickupSubCategoryList>? data;

  PickUpSubcategory({
    this.status,
    this.message,
    this.data,
  });

  factory PickUpSubcategory.fromJson(Map<String, dynamic> json) =>
      PickUpSubcategory(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<PickupSubCategoryList>.from(
                json["data"]!.map((x) => PickupSubCategoryList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class PickupSubCategoryList {
  String? id;
  String? wasteType;
  String? subWasteType;

  PickupSubCategoryList({
    this.id,
    this.wasteType,
    this.subWasteType,
  });

  factory PickupSubCategoryList.fromJson(Map<String, dynamic> json) =>
      PickupSubCategoryList(
        id: json["id"],
        wasteType: json["waste_type"],
        subWasteType: json["sub_waste_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "waste_type": wasteType,
        "sub_waste_type": subWasteType,
      };
}
