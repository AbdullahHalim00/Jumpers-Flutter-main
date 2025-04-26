import 'dart:io';

import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Features/company/job_details/bloc/services/request_more_for_job_api_service.dart';

class RequestMoreForJobJobRepo {
  final RequestMoreForJobApiService _moreForJobApiService =
      Get.put(RequestMoreForJobApiService());

  Future<DataState<bool>>? request({required int jobId}) async {
    try {
      final httpResponse = await _moreForJobApiService.request(
        jobID: jobId,
      );
      if (((httpResponse.statusCode == HttpStatus.ok) ||
          (httpResponse.statusCode == HttpStatus.created) ||
          (httpResponse.statusCode == HttpStatus.accepted))) {
        if (httpResponse.data['status'] != null) {
          return DataSuccess<bool>(
            httpResponse.data['status'],
            message: httpResponse.data['message'],
          );
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
