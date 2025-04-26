import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/user_model.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CompanyInformation/Data/params/organisation_info_params.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CompanyInformation/Data/services/organisation_info_api_servicec.dart';

class OrganisationInfoRepository {
  final OrganisationInfoApiService _organisationInfoApiService =
      Get.put(OrganisationInfoApiService());

  Future<DataState<UserModel>>? enterOrganisationInfo(
      {required OrganisationInfoRequestParams params}) async {
    try {
      final httpResponse = await _organisationInfoApiService
          .enterOrganisationInfo(params: params);
      printDM('enter OrganisationInfoRepository r $httpResponse');
      printDM('enter OrganisationInfoRepository step 1');

      if (((httpResponse.statusCode == HttpStatus.ok) ||
              (httpResponse.statusCode == HttpStatus.created) ||
              (httpResponse.statusCode == HttpStatus.accepted)) &&
          (httpResponse.data['status'] ?? false)) {
        printDM('enter OrganisationInfoRepository step 2');

        if (httpResponse.data['data'] != null) {
          printDM('enter OrganisationInfoRepository step 3');
          log("DATA" + httpResponse.data['data'].toString());

          UserModel userModel = UserModel.fromJson(httpResponse.data['data']);
          printDM('enter OrganisationInfoRepository step 4');
          return DataSuccess<UserModel>(userModel);
        } else {
          printDM('enter OrganisationInfoRepository step 5');
          return DataFailed(ErrorModel(
              errorTitle: httpResponse.data['message'] ?? '',
              errorType: ErrorType.dataEmpty));
        }
      }
      printDM('enter OrganisationInfoRepository step 6');
      return DataFailed(ErrorModel(
          errorTitle: httpResponse.data['message'] ?? '',
          errorType: ErrorType.unKnown));
    } on NetworkDisconnectException {
      printDM('enter OrganisationInfoRepository step 7');

      return DataFailed(ErrorModel(
          errorTitle: 'There is Internet Error',
          errorType: ErrorType.networkConnection));
    } on ServerSideException {
      printDM('enter OrganisationInfoRepository step 8');

      return DataFailed(
          ErrorModel(errorTitle: '', errorType: ErrorType.serverSide));
    } on UnKnownException {
      printDM('enter OrganisationInfoRepository step 9');

      return DataFailed(
          ErrorModel(errorTitle: '', errorType: ErrorType.unKnown));
    } catch (e) {
      printDM('enter OrganisationInfoRepository step 10');

      return DataFailed(
          ErrorModel(errorTitle: '$e', errorType: ErrorType.unKnown));
    }
  }
}
