import 'dart:io';

import 'package:jumper/src/Bloc/models/user_model.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/shared/AuthFeature/Register/Data/params/register_params.dart';
import 'package:jumper/src/Features/shared/AuthFeature/Register/Data/services/register_api_servicec.dart';

class RegisterRepository {
  final RegisterApiService registerApiService = RegisterApiService();

  Future<DataState<UserModel>>? register(
      {required RegisterRequestParams params}) async {
    // try {
    final httpResponse = await registerApiService.register(params: params);
    printDM('httpResponse.statusCode is ${httpResponse.statusCode} -1 ');

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
    // } on NetworkDisconnectException {
    //   return DataFailed(ErrorModel(
    //       errorTitle: networkDisconnectException,
    //       errorType: ErrorType.networkConnection));
    // } on ServerSideException {
    //   return DataFailed(ErrorModel(
    //       errorTitle: serverSideException,
    //       errorType: ErrorType.serverSide));
    // } on UnKnownException {
    //   printDM('enter hnaaa 1 ');
    //   return DataFailed(ErrorModel(
    //       errorTitle: unKnownException, errorType: ErrorType.unKnown));
    // } catch (e) {
    //   printDM('enter hnaaa 2 ');
    //   return DataFailed(
    //       ErrorModel(errorTitle: '$e', errorType: ErrorType.unKnown));
    // }
  }
}
