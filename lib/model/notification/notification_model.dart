class NotificationModel {
  bool? status;
  String? message;
  List<NotificationList>? data;

  NotificationModel({
    this.status,
    this.message,
    this.data,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<NotificationList>.from(
                json["data"]!.map((x) => NotificationList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class NotificationList {
  String? id;
  String? userId;
  String? title;
  String? message;
  String? notifyType;
  DateTime? createdAt;

  NotificationList({
    this.id,
    this.userId,
    this.title,
    this.message,
    this.notifyType,
    this.createdAt,
  });

  factory NotificationList.fromJson(Map<String, dynamic> json) =>
      NotificationList(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        message: json["message"],
        notifyType: json["notify_type"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "message": message,
        "notify_type": notifyType,
        "created_at": createdAt?.toIso8601String(),
      };
}
