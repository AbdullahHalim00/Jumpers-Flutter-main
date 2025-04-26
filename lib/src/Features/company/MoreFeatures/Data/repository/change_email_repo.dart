import 'dart:developer';
import 'dart:io';

import 'package:jumper/src/Bloc/models/user_model.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/company/MoreFeatures/Data/params/change_email_params.dart';
import 'package:jumper/src/Features/company/MoreFeatures/Data/services/change_email_api_servicec.dart';

class ChangeEmailRepository {
  final ChangeEmailApiService _changeEmailApiService = ChangeEmailApiService();

  Future<DataState<UserModel>>? changeEmail(
      {required ChangeEmailRequestParams params}) async {
    try {
      final httpResponse =
          await _changeEmailApiService.changeEmail(params: params);
      printDM('httpResponse.statusCode is ${httpResponse.statusCode} -1 ');
      if (((httpResponse.statusCode == HttpStatus.ok) ||
              (httpResponse.statusCode == HttpStatus.created) ||
              (httpResponse.statusCode == HttpStatus.accepted)) &&
          (httpResponse.data['status'] ?? false)) {
        if (httpResponse.data['data'] != null) {
          log("DATA" + httpResponse.data['data'].toString());

          UserModel userModel = UserModel.fromJson(httpResponse.data['data']);
          return DataSuccess<UserModel>(userModel);
        } else {
          return DataFailed(ErrorModel(
              errorTitle: httpResponse.data['message'] ?? '',
              errorType: ErrorType.dataEmpty));
        }
      } else if (((httpResponse.statusCode == HttpStatus.ok) ||
              (httpResponse.statusCode == HttpStatus.created) ||
              (httpResponse.statusCode == HttpStatus.accepted)) &&
          (httpResponse.data['status'] == false)) {
        printDM('enter hnaaa -1 ');

        return DataFailed(ErrorModel(
            errorTitle: httpResponse.data['message'] ?? '',
            errorType: ErrorType.message));
      } else {
        printDM('enter hnaaa 0 ');
        return DataFailed(ErrorModel(
            errorTitle: httpResponse.data['message'] ?? '',
            errorType: ErrorType.message));
      }
    } on NetworkDisconnectException {
      return DataFailed(ErrorModel(
          errorTitle: networkDisconnectException,
          errorType: ErrorType.networkConnection));
    } on ServerSideException {
      return DataFailed(ErrorModel(
          errorTitle: serverSideException, errorType: ErrorType.serverSide));
    } on UnKnownException {
      printDM('enter hnaaa 1 ');
      return DataFailed(ErrorModel(
          errorTitle: unKnownException, errorType: ErrorType.unKnown));
    } catch (e) {
      printDM('enter hnaaa 2 ');
      return DataFailed(
          ErrorModel(errorTitle: '$e', errorType: ErrorType.unKnown));
    }
  }
}
