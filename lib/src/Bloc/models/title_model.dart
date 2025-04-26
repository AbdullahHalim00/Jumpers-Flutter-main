class TitleModel {
  late int id;
  late String title;
  late String description;
  late int price;
  late bool timeRequired;

//<editor-fold desc="Data Methods">

  TitleModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.timeRequired,
  });

  TitleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    title = json['title'] ?? '';
    description = json['description'] ?? '';
    price = json['minimum_price'] ?? 0;
    if (json['time_required'] != null) {
      timeRequired = (json['time_required'] == 0) ? false : true;
    }
  }

//</editor-fold>
}
