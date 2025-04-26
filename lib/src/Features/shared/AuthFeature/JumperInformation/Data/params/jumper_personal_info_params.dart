import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class JumperPersonalInfoRequestParams {
  final int? genderId;
  final int? cityId;
  final String? address;
  final int? nationalityId;
  final String? birthday;
  final File? image;
  final double? lat;
  final double? lon;

  JumperPersonalInfoRequestParams({
    this.genderId,
    this.cityId,
    this.address,
    this.nationalityId,
    this.birthday,
    this.image,
    this.lat,
    this.lon,
  });

  Future<Map<String, dynamic>> toMap() async {
    return {
      if (genderId != null) 'gender': genderId,
      if (cityId != null) 'city_id': cityId,
      if (address != null) 'address': address,
      if (nationalityId != null) 'nationality_id': nationalityId,
      if (birthday != null) 'birthday': birthday,
      if (lat != null) 'lat': lat,
      if (lon != null) 'lon': lon,
      if (image != null)
        'image': await MultipartFile.fromFile(
          image!.path,
          filename: image!.path.split("/").last,
          contentType: MediaType("image", "png"),
          headers: {
            'type': ['image/png']
          },
        ),
    };
  }
}
