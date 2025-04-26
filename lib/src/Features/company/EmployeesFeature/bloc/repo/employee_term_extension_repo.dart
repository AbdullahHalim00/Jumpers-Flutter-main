import 'dart:io';

import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Features/company/EmployeesFeature/bloc/params/employee_term_extension_params.dart';
import 'package:jumper/src/Features/company/EmployeesFeature/bloc/services/employee_term_extension_api_service.dart';

class EmployeeTermExtensionApiRepo {
  final EmployeeTermExtensionApiService _termExtensionApiService =
      Get.put(EmployeeTermExtensionApiService());

  Future<DataState<bool>> extendPeriod(
      {required EmployeeTermExtensionParams params}) async {
    try {
      final httpResponse = await _termExtensionApiService.extendPeriod(
        params: params,
      );

      if (((httpResponse.statusCode == HttpStatus.ok) ||
          (httpResponse.statusCode == HttpStatus.created) ||
          (httpResponse.statusCode == HttpStatus.accepted))) {
        if (httpResponse.data['status'] == true) {
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
