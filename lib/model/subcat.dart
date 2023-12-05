class SubCategoryModel {
  bool? status;
  String? message;
  List<SubCategorylist>? data;

  SubCategoryModel({
    this.status,
    this.message,
    this.data,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      SubCategoryModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<SubCategorylist>.from(
                json["data"]!.map((x) => SubCategorylist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class SubCategorylist {
  String? id;
  String? subCatName;
  String? subCatDesc;
  DateTime? createdAt;
  String? categoryId;

  SubCategorylist({
    this.id,
    this.subCatName,
    this.subCatDesc,
    this.createdAt,
    this.categoryId,
  });

  factory SubCategorylist.fromJson(Map<String, dynamic> json) =>
      SubCategorylist(
        id: json["id"],
        subCatName: json["sub_cat_name"],
        subCatDesc: json["sub_cat_desc"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        categoryId: json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sub_cat_name": subCatName,
        "sub_cat_desc": subCatDesc,
        "created_at": createdAt?.toIso8601String(),
        "category_id": categoryId,
      };
}
