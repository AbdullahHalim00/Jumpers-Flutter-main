import 'package:jumper/src/Core/utils/utils.dart';

class Service {
  late int id;
  late String title;
  late List<dynamic> serviceImages;
  late String municipalImages;

  late int minimumPrice;
  late int imagesRequired;
  late int municipalRequired;

//<editor-fold desc="Service">

  Service({
    required this.id,
    required this.title,
    required this.serviceImages,
    required this.municipalImages,
    required this.minimumPrice,
    required this.imagesRequired,
    required this.municipalRequired,
  });

  @override
  String toString() {
    return 'Service{ id: $id, title: $title, service_images: $serviceImages, palad_images: $municipalImages,}';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'service_images': serviceImages,
      'palad_images': municipalImages,
      'minimum_price': minimumPrice,
      'images_required': imagesRequired,
      'municipal_required': municipalRequired,
    };
  }

  Service.fromJson(Map<String, dynamic> map) {
    printDM('mapmapmapmap => $map');
    id = map['id'] ?? 0;
    printDM('Service id => $id');
    title = map['title'] ?? "";
    printDM('Service title => $title');
    serviceImages = map['service_images'] != null ? List.from(map['service_images']) : [];
    printDM('Service service_images => $serviceImages');
    municipalImages = map['palad_image'] ?? map['palad_images'] ??"";
    printDM('Service palad_image => $municipalImages');

    minimumPrice = map['minimum_price'] ?? 0;
    imagesRequired = map['images_required'] ?? 0;
    municipalRequired = map['municipal_required'] ?? 0;
  }

//</editor-fold>
}
