class CategoryModel {
  bool? status;
  String? message;
  List<CatagoryList>? data;

  CategoryModel({
    this.status,
    this.message,
    this.data,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<CatagoryList>.from(
                json["data"]!.map((x) => CatagoryList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CatagoryList {
  String? id;
  String? categoryName;
  String? categoryDesc;
  DateTime? createdAt;

  CatagoryList({
    this.id,
    this.categoryName,
    this.categoryDesc,
    this.createdAt,
  });

  factory CatagoryList.fromJson(Map<String, dynamic> json) => CatagoryList(
        id: json["id"],
        categoryName: json["category_name"],
        categoryDesc: json["category_desc"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "category_desc": categoryDesc,
        "created_at": createdAt?.toIso8601String(),
      };
}
