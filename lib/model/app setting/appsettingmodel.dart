class AppSettingModel {
  bool? status;
  String? message;
  List<AppSettingList>? data;

  AppSettingModel({
    this.status,
    this.message,
    this.data,
  });

  factory AppSettingModel.fromJson(Map<String, dynamic> json) =>
      AppSettingModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<AppSettingList>.from(
                json["data"]!.map((x) => AppSettingList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class AppSettingList {
  String? id;
  String? welMessage;
  String? privatePolicy;
  String? termsCondition;
  String? contactUs;
  String? aboutUs;
  String? faq;

  AppSettingList({
    this.id,
    this.welMessage,
    this.privatePolicy,
    this.termsCondition,
    this.contactUs,
    this.aboutUs,
    this.faq,
  });

  factory AppSettingList.fromJson(Map<String, dynamic> json) => AppSettingList(
        id: json["id"],
        welMessage: json["wel_message"],
        privatePolicy: json["private_policy"],
        termsCondition: json["terms_condition"],
        contactUs: json["contact_us"],
        aboutUs: json["about_us"],
        faq: json["faq"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "wel_message": welMessage,
        "private_policy": privatePolicy,
        "terms_condition": termsCondition,
        "contact_us": contactUs,
        "about_us": aboutUs,
        "faq": faq,
      };
}
