import 'dart:io';

import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/jumper_job_model.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Features/jumper/JumperHomeFeature/bloc/services/jumper_jobs_api_services.dart';

class JumperJobsRepository {
  final JumperJobsApiService _jumperJobsApiService =
      Get.put(JumperJobsApiService());

  Future<DataState<JumperJobModel>>? fetchMyJobs() async {
    try {
      final httpResponse = await _jumperJobsApiService.fetchMyJobs();
      if (((httpResponse.statusCode == HttpStatus.ok) ||
              (httpResponse.statusCode == HttpStatus.created) ||
              (httpResponse.statusCode == HttpStatus.accepted)) &&
          (httpResponse.data['status'] ?? false)) {
        if (httpResponse.data['data'] != null) {
          final data = JumperJobModel.fromMap(httpResponse.data['data']);
          return DataSuccess<JumperJobModel>(data);
        } else {
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
