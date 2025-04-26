import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/user_model.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Features/shared/AuthFeature/JumperInformation/Data/params/jumper_employment_info_params.dart';
import 'package:jumper/src/Features/shared/AuthFeature/JumperInformation/Data/services/jumper_employment_info_api_servicec.dart';

class JumperEmploymentInfoRepository {
  final JumperEmploymentInfoApiService _jumperEmploymentInfoApiService =
      Get.put(JumperEmploymentInfoApiService());

  Future<DataState<UserModel>>? enterJumperEmploymentInfo(
      {required JumperEmploymentInfoRequestParams params}) async {
    try {
      final httpResponse = await _jumperEmploymentInfoApiService
          .enterJumperEmploymentInfo(params: params);
      if (((httpResponse.statusCode == HttpStatus.ok) ||
              (httpResponse.statusCode == HttpStatus.created) ||
              (httpResponse.statusCode == HttpStatus.accepted)) &&
          (httpResponse.data['status'] ?? false)) {
        if (httpResponse.data['data'] != null) {
          log("DATA" + httpResponse.data['data'].toString());

          UserModel userModel = UserModel.fromJson(httpResponse.data['data']);
          return DataSuccess<UserModel>(userModel,
              message: httpResponse.data['message']);
        } else {
          return DataFailed(ErrorModel(
              errorTitle: httpResponse.data['message'] ?? '',
              errorType: ErrorType.dataEmpty));
        }
      }
      return DataFailed(ErrorModel(
          errorTitle: httpResponse.data['message'] ?? '',
          errorType: ErrorType.unKnown));
    } on NetworkDisconnectException {
      return DataFailed(ErrorModel(
          errorTitle: 'There is Internet Error',
          errorType: ErrorType.networkConnection));
    } on ServerSideException {
      return DataFailed(
          ErrorModel(errorTitle: '', errorType: ErrorType.serverSide));
    } on UnKnownException {
      return DataFailed(
          ErrorModel(errorTitle: '', errorType: ErrorType.unKnown));
    } catch (e) {
      return DataFailed(
          ErrorModel(errorTitle: '$e', errorType: ErrorType.unKnown));
    }
  }
}
