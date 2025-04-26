class NotificationsModel {
  NotificationsModel({
    this.id,
    this.title,
    this.text,
    this.createdAt,
    this.image,
  });

  int? id;
  String? title;
  String? text;
  String? image;
  String? createdAt;

  factory NotificationsModel.fromJson(Map<String, dynamic> json) =>
      NotificationsModel(
        id: json["id"],
        title: json["title"],
        text: json["text"],
        // image: json["image"],
        createdAt: json["date"],
      );
}
