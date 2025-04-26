import 'dart:developer';
import 'dart:io';

import 'package:jumper/src/Bloc/models/user_model.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/shared/AuthFeature/login/Data/params/login_params.dart';
import 'package:jumper/src/Features/shared/AuthFeature/login/Data/services/login_api_servicec.dart';

class LoginRepository {
  final LoginApiService loginApiService = LoginApiService();

  Future<DataState<UserModel>>? login(
      {required LoginRequestParams params}) async {
    try {
      final httpResponse = await loginApiService.login(params: params);
      printDM("Login REPO 1");

      if (((httpResponse.statusCode == HttpStatus.ok) ||
              (httpResponse.statusCode == HttpStatus.created) ||
              (httpResponse.statusCode == HttpStatus.accepted)) &&
          (httpResponse.data['status'] ?? false)) {
        if (httpResponse.data['data'] != null) {
          log('HUNTER' + httpResponse.data['data'].toString());
          printDM("Login REPO 2");
          printDM("Login REPO 2+ ${httpResponse.data['data']}");
          UserModel userModel = UserModel.fromJson(httpResponse.data['data']);
          printDM("Login REPO 3${userModel}");
          return DataSuccess<UserModel>(userModel);
        } else {
          log('HUNTER' + httpResponse.data['data'].toString());
          return DataFailed(ErrorModel(
              errorTitle: "Error dataEmpty ", errorType: ErrorType.dataEmpty));
        }
      } else {
        log('HUNTER' + httpResponse.data['data'].toString());
        return DataFailed(ErrorModel(
            errorTitle: httpResponse.data['message'] ?? '',
            errorType: ErrorType.unKnown));
      }
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
