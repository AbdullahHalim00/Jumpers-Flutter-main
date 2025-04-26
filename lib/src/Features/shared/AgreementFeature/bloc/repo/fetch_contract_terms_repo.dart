import 'dart:io';

import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Features/shared/AgreementFeature/bloc/services/fetch_contract_terms_api_services.dart';
import 'package:jumper/src/Features/shared/TermsAndConditionsFeature/bloc/model/terms_privacy_model.dart';

class FetchContractTermsRepo {
  final FetchContractTermsApiServices _termsApiServices =
      Get.put(FetchContractTermsApiServices());

  Future<DataState<TermsPrivacyModel>>? fetchAgreement() async {
    try {
      final httpResponse = await _termsApiServices.fetchAgreement();
      if (((httpResponse.statusCode == HttpStatus.ok) ||
          (httpResponse.statusCode == HttpStatus.created) ||
          (httpResponse.statusCode == HttpStatus.accepted &&
              (httpResponse.data['status'] ?? false)))) {
        if (httpResponse.data['data'] != null) {
          return DataSuccess<TermsPrivacyModel>(
              TermsPrivacyModel.fromJson(httpResponse.data['data']));
        } else {
          return DataFailed(httpResponse.data['message'] ?? '');
        }
      }
      return DataFailed(httpResponse.data['message'] ?? '');
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
