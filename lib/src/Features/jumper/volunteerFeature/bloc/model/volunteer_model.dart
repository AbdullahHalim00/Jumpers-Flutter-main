class VolunteerModel {
  List<VolunteerData>? data = [];

  VolunteerModel({
    this.data,
  });

  factory VolunteerModel.fromJson(Map<String, dynamic> json) {
    return VolunteerModel(
        data: List<VolunteerData>.from(
            json["data"].map((x) => VolunteerData.fromJson(x))));
  }
}

class VolunteerData {
  int? id;
  String? title;
  String? subtitle;

  VolunteerData({
    this.id,
    this.title,
    this.subtitle,
  });

  VolunteerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
  }
}
