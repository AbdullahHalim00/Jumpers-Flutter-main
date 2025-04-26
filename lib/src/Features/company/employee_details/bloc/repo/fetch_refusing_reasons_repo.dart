import 'dart:io';

import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/title_model.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Features/company/employee_details/bloc/services/fetch_refusing_reasons_api_service.dart';

class FetchRefusingReasonsRepo {
  final FetchRefusingReasonsApiService _fetchRefusingReasonsApiService =
      Get.put(FetchRefusingReasonsApiService());

  Future<DataState<List<TitleModel>>>? fetchRefusingReasons() async {
    try {
      final httpResponse = await _fetchRefusingReasonsApiService.fetchReasons();
      if (((httpResponse.statusCode == HttpStatus.ok) ||
              (httpResponse.statusCode == HttpStatus.created) ||
              (httpResponse.statusCode == HttpStatus.accepted)) &&
          (httpResponse.data['status'] ?? false)) {
        if (httpResponse.data['data'] != null) {
          List<TitleModel> reasons = [];
          for (var item in (httpResponse.data['data'] as List)) {
            reasons.add(TitleModel.fromJson(item));
          }
          return DataSuccess<List<TitleModel>>(reasons);
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
