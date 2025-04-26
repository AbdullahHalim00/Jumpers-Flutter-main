import 'dart:io';

import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Features/company/HomeFeature/bloc/model/company_statics_model.dart';
import 'package:jumper/src/Features/company/HomeFeature/bloc/service/fetch_api_company_statics_api_service.dart';

class FetchCompanyStaticsRepository {
  final FetchCompanyStaticsApiService _fetchCompanyStaticsApiService =
      Get.put(FetchCompanyStaticsApiService());

  Future<DataState<CompanyStaticsModel>>? fetchCompanyStatics() async {
    try {
      final httpResponse =
          await _fetchCompanyStaticsApiService.fetchCompanyStatics();

      if (((httpResponse.statusCode == HttpStatus.ok) ||
              (httpResponse.statusCode == HttpStatus.created) ||
              (httpResponse.statusCode == HttpStatus.accepted)) &&
          (httpResponse.data['status'] ?? false)) {
        if (httpResponse.data['data'] != null) {
          CompanyStaticsModel statics =
              CompanyStaticsModel.fromMap(httpResponse.data['data']);

          return DataSuccess<CompanyStaticsModel>(statics);
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
