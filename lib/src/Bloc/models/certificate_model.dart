class CertificateModel {
  late int id;
  late String text;
  late String description;
  late String image;
  late String grade;

//<editor-fold desc="Data Methods">

  CertificateModel({
    required this.id,
    required this.text,
    required this.image,
    required this.description,
    required this.grade,
  });

  CertificateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    text = json['title'] ?? '';
    description = json['description'] ?? '';
    image = json['image'] ?? '';
    grade = json['grade'] ?? '';
  }
}
