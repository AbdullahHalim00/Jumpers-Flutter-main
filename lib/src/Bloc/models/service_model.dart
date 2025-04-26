class ServiceModel {
  late int id;
  late String title;
  late int minimumPrice;
  late int imagesRequired;
  late int municipalRequired;

  ServiceModel({
    required this.id,
    required this.title,
    required this.minimumPrice,
    required this.imagesRequired,
    required this.municipalRequired,
  });

  @override
  String toString() => {
        "id": id,
        "title": title,
        "minimum_price": minimumPrice,
        "images_required": imagesRequired,
        "municipal_required": municipalRequired,
      }.toString();

  ServiceModel.fromMap(Map<String, dynamic> map) {
    id = map['id'] ?? 0;
    title = map['title'] ?? "";
    minimumPrice = map['minimum_price'] ?? 0;
    imagesRequired = map['images_required'] ?? 0;
    municipalRequired = map['municipal_required'] ?? 0;
  }
}
