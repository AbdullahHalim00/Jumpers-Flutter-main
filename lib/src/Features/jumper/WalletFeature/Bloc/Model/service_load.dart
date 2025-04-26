import 'package:jumper/src/Bloc/models/service_model.dart';

class ServiceLoaded {
  late ServiceModel serviceModel;
  late List<dynamic>? serviceImages;
  late dynamic municipalImage;

  ServiceLoaded({
    required this.serviceModel,
    this.serviceImages,
    this.municipalImage,
  });

  @override
  toString() => {
        "serviceModel": serviceModel,
        "serviceImages": serviceImages,
        "municipalImage": municipalImage,
      }.toString();
}
