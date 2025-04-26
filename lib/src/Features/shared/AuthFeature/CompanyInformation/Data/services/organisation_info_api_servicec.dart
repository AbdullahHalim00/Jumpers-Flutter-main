import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:jumper/src/Core/services/network/api_names.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Core/services/network/network_services.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CompanyInformation/Data/params/organisation_info_params.dart';

class OrganisationInfoApiService with ApiNames {
  final NetworkService _networkService = Get.put(NetworkService());

  Future<Response> enterOrganisationInfo(
      {required OrganisationInfoRequestParams params}) async {
    Response response;
    try {
      log("HZM" + params.commecialNumber.toString());
      log("HZM" + params.taxNumber.toString());
      log("HZM" + params.builderNumber.toString());
      log("HZM" + params.ipanNumber.toString());
      log("HZM" + params.bankAccountNumber.toString());

      response = await _networkService.post(
        url: uRLSetOrganizationInfo,
        auth: true,
        body: await params.toMap(),
      );
    } on NetworkDisconnectException {
      throw NetworkDisconnectException('No Internet Connection');
    } on ServerSideException {
      throw ServerSideException('Server Side Exception');
    } on UnKnownException {
      throw UnKnownException('There Is UnKnown Exception');
    } catch (e) {
      throw UnKnownException(e.toString());
    }
    return response;
  }
}
