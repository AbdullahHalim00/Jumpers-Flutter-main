import 'dart:io';

import 'package:get/instance_manager.dart';
import 'package:jumper/src/Bloc/models/user_model.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CheckPhoneAndResetPassword/Data/params/check_phone_params.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CheckPhoneAndResetPassword/Data/services/check_phone_api_servicec.dart';

class CheckPhoneRepository {
  final CheckPhoneApiService _checkEmailApiService =
      Get.put(CheckPhoneApiService());

  Future<DataState<UserModel>>? checkPhone(
      {required CheckPhoneRequestParams params}) async {
    try {
      final httpResponse =
          await _checkEmailApiService.checkPhone(params: params);
      if (((httpResponse.statusCode == HttpStatus.ok) ||
              (httpResponse.statusCode == HttpStatus.created) ||
              (httpResponse.statusCode == HttpStatus.accepted)) &&
          (httpResponse.data['status'] ?? false)) {
        if (httpResponse.data['data'] != null) {
          UserModel userModel = UserModel.fromJson(httpResponse.data['data']);
          return DataSuccess<UserModel>(userModel);
        } else {
          return DataFailed(ErrorModel(
              errorTitle: httpResponse.data['message'] ?? '',
              errorType: ErrorType.dataEmpty));
        }
      }
      return DataFailed(ErrorModel(
          errorTitle: httpResponse.data['message'] ?? '',
          errorType: ErrorType.message));
    } on NetworkDisconnectException {
      return DataFailed(ErrorModel(
          errorTitle: networkDisconnectException,
          errorType: ErrorType.networkConnection));
    } on ServerSideException {
      return DataFailed(ErrorModel(
          errorTitle: serverSideException, errorType: ErrorType.serverSide));
    } on UnKnownException {
      return DataFailed(ErrorModel(
          errorTitle: unKnownException, errorType: ErrorType.unKnown));
    } catch (e) {
      return DataFailed(
          ErrorModel(errorTitle: '$e', errorType: ErrorType.unKnown));
    }
  }
}
