import 'dart:io';

import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Features/company/employee_details/bloc/params/finish_employee_params.dart';
import 'package:jumper/src/Features/company/employee_details/bloc/services/finish_employee_api_service.dart';

///.....
///.
class FinishEmployeeApiRepo {
  final FinishEmployeeApiService _finishEmployeeApiService =
      Get.put(FinishEmployeeApiService());

  Future<DataState<bool>>? fire({required FinishEmployeeParams params}) async {
    try {
      final httpResponse = await _finishEmployeeApiService.fire(params);
      if (((httpResponse.statusCode == HttpStatus.ok) ||
          (httpResponse.statusCode == HttpStatus.created) ||
          (httpResponse.statusCode == HttpStatus.accepted))) {
        if (httpResponse.data['status'] != null) {
          return DataSuccess<bool>(httpResponse.data['status'],
              message: httpResponse.data['message']);
        } else {
          return DataFailed(
            ErrorModel(
              errorTitle: httpResponse.data['message'] ?? '',
              errorType: ErrorType.dataEmpty,
            ),
          );
        }
      }
      return DataFailed(
        ErrorModel(
          errorTitle: httpResponse.data['message'] ?? '',
          errorType: ErrorType.unKnown,
        ),
      );
    } on NetworkDisconnectException {
      return DataFailed(
        ErrorModel(
          errorTitle: networkDisconnectException,
          errorType: ErrorType.networkConnection,
        ),
      );
    } on ServerSideException {
      return DataFailed(
        ErrorModel(
          errorTitle: serverSideException,
          errorType: ErrorType.serverSide,
        ),
      );
    } on UnKnownException {
      return DataFailed(
        ErrorModel(
          errorTitle: unKnownException,
          errorType: ErrorType.unKnown,
        ),
      );
    } catch (e) {
      return DataFailed(
        ErrorModel(
          errorTitle: '$e',
          errorType: ErrorType.unKnown,
        ),
      );
    }
  }
}
