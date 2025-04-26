import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/user_model.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Features/jumper/JumperHomeFeature/bloc/services/company_details_api_services.dart';

class CompanyDetailsRepository {
  final CompanyDetailsApiService _companyDetailsApiService =
      Get.put(CompanyDetailsApiService());

  Future<DataState<UserModel>>? fetchCompany({required int id}) async {
    try {
      final httpResponse = await _companyDetailsApiService.fetchCompany(id);
      if (((httpResponse.statusCode == HttpStatus.ok) ||
              (httpResponse.statusCode == HttpStatus.created) ||
              (httpResponse.statusCode == HttpStatus.accepted)) &&
          (httpResponse.data['status'] ?? false)) {
        if (httpResponse.data['data'] != null) {
          log("DATA${httpResponse.data['data']}");

          final data = UserModel.fromJson(httpResponse.data['data']);
          log("+++++++ fetchCompany $data");
          return DataSuccess<UserModel>(data);
        } else {
          return DataFailed(
            ErrorModel(
              errorTitle: httpResponse.data['message'] ?? '',
              errorType: ErrorType.dataEmpty,
            ),
          );
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
