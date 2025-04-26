import 'dart:io';

import 'package:get/get.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Features/company/job_details/bloc/model/job_employees_model.dart';
import 'package:jumper/src/Features/company/job_details/bloc/services/job_employees_api_service.dart';

class JobEmployeesRepository {
  final JobEmployeesApiService _jobEmployeesApiService =
      Get.put(JobEmployeesApiService());

  Future<DataState<JobEmployeesModel>>? fetchEmployees(int jobID) async {
    // try {
    final httpResponse = await _jobEmployeesApiService.fetchEmployees(jobID);

    if (((httpResponse.statusCode == HttpStatus.ok) ||
            (httpResponse.statusCode == HttpStatus.created) ||
            (httpResponse.statusCode == HttpStatus.accepted)) &&
        (httpResponse.data['status'] ?? false)) {
      if (httpResponse.data != null) {
        JobEmployeesModel jobEmployeesModel =
            JobEmployeesModel.fromJson(httpResponse.data);
        return DataSuccess<JobEmployeesModel>(jobEmployeesModel);
      } else {
        return DataFailed(ErrorModel(
            errorTitle: httpResponse.data['message'] ?? '',
            errorType: ErrorType.dataEmpty));
      }
    }

    return DataFailed(ErrorModel(
        errorTitle: httpResponse.data['message'] ?? '',
        errorType: ErrorType.unKnown));
    // } on NetworkDisconnectException {
    //   return DataFailed(ErrorModel(
    //       errorTitle: networkDisconnectException,
    //       errorType: ErrorType.networkConnection));
    // } on ServerSideException {
    //   return DataFailed(ErrorModel(
    //       errorTitle: serverSideException, errorType: ErrorType.serverSide));
    // } on UnKnownException {
    //   return DataFailed(ErrorModel(
    //       errorTitle: unKnownException, errorType: ErrorType.unKnown));
    // } catch (e) {
    //   return DataFailed(
    //       ErrorModel(errorTitle: '$e', errorType: ErrorType.unKnown));
    // }
  }
}
