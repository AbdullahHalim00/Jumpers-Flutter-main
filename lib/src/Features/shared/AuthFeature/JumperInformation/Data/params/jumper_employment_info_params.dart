import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:jumper/src/Core/utils/utils.dart';

class JumperEmploymentInfoRequestParams {
  final List<int> skillsIds;
  final List<int> serviceIds;
  final String about;

  // final List<int> languageIds;
  final File? cv;
  final List<dynamic>? serviceImages;
  final List<dynamic>? municipalImages;

  JumperEmploymentInfoRequestParams({
    required this.skillsIds,
    required this.serviceIds,
    required this.about,
    // required this.languageIds,
    this.cv,
    this.serviceImages,
    this.municipalImages,
  });

  Future<Map<String, dynamic>?> toMap() async {
    Map<String, dynamic> map = {
      if (skillsIds.isNotEmpty) 'skills_ids[]': skillsIds,
      if (serviceIds.isNotEmpty) 'service_ids[]': serviceIds,
      if (about.isNotEmpty) 'about': about,
      // 'language_ids[]': languageIds,
      if (cv != null)
        'cv': await MultipartFile.fromFile(
          cv!.path,
          filename: cv!.path.split("/").last,
          contentType: MediaType("image", "pdf"),
          headers: {
            'type': ['image/pdf']
          },
        ),
    };
    if (serviceImages != null) {
      for (int index = 0; index < serviceImages!.length; index++) {
        List<dynamic> serviceInnerImages = serviceImages![index] ?? [];
        for (int imageIndex = 0;
            imageIndex < serviceInnerImages.length;
            imageIndex++) {
          if (serviceInnerImages[imageIndex] is File) {
            map["service_images[$index][$imageIndex]"] =
                await MultipartFile.fromFile(
              serviceInnerImages[imageIndex].path,
              filename: serviceInnerImages[imageIndex].path.split("/").last,
              contentType: MediaType("image", "png"),
              headers: {
                'type': ['image/png']
              },
            );
          } else {
            map["service_images[$index][$imageIndex]"] =
                serviceInnerImages[imageIndex];
          }
        }
      }
    }
    if (municipalImages != null) {
      for (int index = 0; index < municipalImages!.length; index++) {
        if (municipalImages![index] is File) {
          map["palad_images[$index]"] = await MultipartFile.fromFile(
            municipalImages![index]!.path,
            filename: '${municipalImages![index]!.path.split("/").last}',
            contentType: MediaType("image", "png"),
            headers: {
              'type': ['image/png']
            },
          );
        }
      }
    }
    printDM("MAAAAAAAAAAAAAAP $map");
    return map;
    // return {
    //   'skills_ids[]': skillsIds,
    //   'service_ids[]': serviceIds,
    //   'about': about,
    //   'language_ids[]': languageIds,
    //   if (cv != null)
    //     'cv': await MultipartFile.fromFile(
    //       cv!.path,
    //       filename: '${cv!.path.split("/").last}',
    //       contentType: MediaType("image", "pdf"),
    //       headers: {
    //         'type': ['image/pdf']
    //       },
    //     ),
    //   // if (service_images != null) 'service_images[]': service_images,
    //   if (palad_images != null) 'palad_images[]': palad_images,
    // };
  }
}
