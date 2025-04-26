import 'dart:io';

import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/company_job_model.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/params/add_job_params.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/service/add_job_api_service.dart';

class AddJobRepository {
  final AddJobApiService _addJobApiService = Get.put(AddJobApiService());

  Future<DataState<CompanyJobModel>>? addJob({
    required AddJobParameters parameters,
    required isEdit,
  }) async {
    try {
      final httpResponse = await _addJobApiService.addJob(
        parameters: parameters,
        isEdit: isEdit,
      );

      printDM(parameters.startDate.toString());
      printDM(parameters.endDate.toString());
      if (((httpResponse.statusCode == HttpStatus.ok) ||
              (httpResponse.statusCode == HttpStatus.created) ||
              (httpResponse.statusCode == HttpStatus.accepted)) &&
          (httpResponse.data['status'] ?? false)) {
        if (httpResponse.data['data'] != null) {
          CompanyJobModel request =
              CompanyJobModel.fromMap(httpResponse.data['data']);
          printDM("request in add job repo is $request");
          return DataSuccess<CompanyJobModel>(request,
              message: httpResponse.data['message']);
        } else {
          printDM("     response : $httpResponse");
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
