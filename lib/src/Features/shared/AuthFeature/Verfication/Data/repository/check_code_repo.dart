import 'dart:io';

import 'package:jumper/src/Bloc/models/user_model.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/shared/AuthFeature/Verfication/Data/params/check_code_params.dart';
import 'package:jumper/src/Features/shared/AuthFeature/Verfication/Data/services/check_code_api_servicec.dart';

class CheckCodeRepository {
  final CheckCodeApiService _checkCodeApiService = CheckCodeApiService();

  Future<DataState<UserModel>>? checkCode(
      {required CheckCodeRequestParams params}) async {
    try {
      final httpResponse = await _checkCodeApiService.checkCode(params: params);
      if (((httpResponse.statusCode == HttpStatus.ok) ||
              (httpResponse.statusCode == HttpStatus.created) ||
              (httpResponse.statusCode == HttpStatus.accepted)) &&
          (httpResponse.data['status'] ?? false)) {
        if (httpResponse.data['data'] != null) {
          UserModel userModel = UserModel.fromJson(httpResponse.data['data']);
          return DataSuccess<UserModel>(userModel);
        } else {
          return DataFailed(
            ErrorModel(
              errorTitle: httpResponse.data['message'] ?? '',
              errorType: ErrorType.dataEmpty,
            ),
          );
        }
      } else if (((httpResponse.statusCode == HttpStatus.ok) ||
              (httpResponse.statusCode == HttpStatus.created) ||
              (httpResponse.statusCode == HttpStatus.accepted)) &&
          (httpResponse.data['status'] == false)) {
        printDM('title hena ya hamada 123');
        return DataFailed(ErrorModel(
            errorTitle: httpResponse.data['message'] ?? '',
            errorType: ErrorType.message));
      }
      return DataFailed(ErrorModel(
          errorTitle: httpResponse.data['message'] ?? '',
          errorType: ErrorType.unKnown));
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
