import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class OrganisationInfoRequestParams {
  final int? organisationTypeId;
  final String? adminName;
  final int? adminTypeId;
  final String? adminEmail;
  final String? adminPhone;
  final String? adminNote;

  // final int? workActivityId;
  // final int? sectorId;
  // final String? crNum;
  final int? headquarterCityId;
  final String? headquarterAddress;
  final String? commecialNumber;
  final String? taxNumber;
  final String? builderNumber;
  final String? ipanNumber;
  final String? bankAccountNumber;
  final double? lat;
  final double? lon;
  final int? identityTypeId;
  final String? identityNum;
  final File? image;

  OrganisationInfoRequestParams({
    this.organisationTypeId,
    this.adminName,
    this.adminTypeId,
    this.adminEmail,
    this.adminPhone,
    this.adminNote,
    // this.workActivityId,
    // this.crNum,
    // this.sectorId,
    this.headquarterCityId,
    this.headquarterAddress,
    this.commecialNumber,
    this.taxNumber,
    this.builderNumber,
    this.ipanNumber,
    this.bankAccountNumber,
    this.lat,
    this.lon,
    this.identityTypeId,
    this.identityNum,
    this.image,
  });

  Future<Map<String, dynamic>> toMap() async {
    return
        // organisationTypeId! == 0 ?
        {
      if (organisationTypeId != null) 'company_type': organisationTypeId,
      if (adminName != null) 'manager_name': adminName,
      if (adminTypeId != null) 'responsible_attribute_id': adminTypeId,
      if (adminEmail != null) 'manager_email': adminEmail,
      if (adminPhone != null) 'manager_phone': adminPhone,
      if (adminNote != null) 'manager_notes': adminNote,
      // 'work_activity_id': workActivityId,
      // 'sector_id': sectorId,
      // 'cr_no': crNum,
      if (headquarterCityId != null) 'city_id': headquarterCityId,
      if (headquarterAddress != null) 'address': headquarterAddress,
      if (headquarterAddress != null) 'commercial_register': commecialNumber,
      if (headquarterAddress != null) 'tax_number': taxNumber,
      if (headquarterAddress != null) 'building_number': builderNumber,
      if (headquarterAddress != null) 'iban': ipanNumber,
      if (headquarterAddress != null) 'account_number': bankAccountNumber,
      if (identityTypeId != null) 'identity_type_id': identityTypeId,
      if (identityNum != null) 'identity_number': identityNum,
      if (lat != null) 'lat': lat,
      if (lon != null) 'lon': lon,
      if (image != null)
        'image': await MultipartFile.fromFile(image!.path,
            filename: '${image!.path.split("/").last}',
            contentType: MediaType("image", "png"),
            headers: {
              'type': ['image/png']
            }),
    };

    // : {
    //   if (organisationTypeId != null) 'company_type': organisationTypeId,
    //   if (adminName != null) 'manager_name': adminName,
    //   if (adminTypeId != null)
    //     'responsible_attribute_id': adminTypeId,
    //   if (adminEmail != null) 'manager_email': adminEmail,
    //   if (adminPhone != null) 'manager_phone': adminPhone,
    //   if (adminNote != null) 'manager_notes': adminNote,
    //   if (identityTypeId != null) 'identity_type_id': identityTypeId,
    //   if (identityNum != null) 'identity_number': identityNum,
    // };
  }
}
