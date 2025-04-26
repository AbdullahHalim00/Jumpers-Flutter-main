import 'dart:io';

import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/contact_model.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Features/company/job_details/bloc/services/accept_employee_api_service.dart';

import '../../../../../Ui/snackbar/app_snacks.dart';

class AcceptEmployeeApiRepo {
  final AcceptEmployeeApiService _acceptEmployeeApiService =
      Get.put(AcceptEmployeeApiService());

  Future<DataState<bool>>? acceptEmployee(
      {required int jobId, required int employeeID}) async {
    try {
      final httpResponse = await _acceptEmployeeApiService.accept(
          jobID: jobId, employeeID: employeeID);
      if (((httpResponse.statusCode == HttpStatus.ok) ||
          (httpResponse.statusCode == HttpStatus.created) ||
          (httpResponse.statusCode == HttpStatus.accepted))) {
        if (httpResponse.data['status'] == true) {
          return DataSuccess<bool>(httpResponse.data['status']);
        } else {
          AppSnacks.requestError(
              error: "${httpResponse.data['message']}", isToast: false);

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

  Future<DataState<ContactUsResponse>>? rateEmployee(
      {required int jobId,
      required int employeeID,
      required double rate}) async {
    try {
      final httpResponse = await _acceptEmployeeApiService.rateEmp(
          jobID: jobId, employeeID: employeeID, rate: rate);
      if (((httpResponse.statusCode == HttpStatus.ok) ||
          (httpResponse.statusCode == HttpStatus.created) ||
          (httpResponse.statusCode == HttpStatus.accepted))) {
        if (httpResponse.data['status'] == "200") {
          return DataSuccess<ContactUsResponse>(
              ContactUsResponse.fromJson(httpResponse.data));
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
