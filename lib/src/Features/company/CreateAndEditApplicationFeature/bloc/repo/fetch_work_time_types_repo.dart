import 'dart:io';

import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/title_model.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/service/fetch_work_time_types_api_service.dart';

class FetchWorkTimeTypesRepository {
  final FetchWorkTimeTypesApiService _fetchWorkTimeTypesApiService =
      Get.put(FetchWorkTimeTypesApiService());

  Future<DataState<List<TitleModel>>>? fetchWorkTimeTypes() async {
    try {
      final httpResponse =
          await _fetchWorkTimeTypesApiService.fetchWorkTimeTypes();
      if (((httpResponse.statusCode == HttpStatus.ok) ||
              (httpResponse.statusCode == HttpStatus.created) ||
              (httpResponse.statusCode == HttpStatus.accepted)) &&
          (httpResponse.data['status'] ?? false)) {
        if (httpResponse.data['data'] != null) {
          List<TitleModel> workTimeTypes = [];
          for (var item in (httpResponse.data['data'] as List)) {
            workTimeTypes.add(TitleModel.fromJson(item));
          }
          return DataSuccess<List<TitleModel>>(workTimeTypes);
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
