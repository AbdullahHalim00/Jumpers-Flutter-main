import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/faq_model.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Features/company/HelpCenterFeature/bloc/ApiServices/faq_api_services.dart';

import '../../../../../Bloc/models/contact_model.dart';

class FAQRepo {
  final FAQApiServices _faqApiServices = Get.put(FAQApiServices());

  Future<DataState<List<FAQModel>>>? fetchFAQUs() async {
    try {
      final httpResponse = await _faqApiServices.fetchFAQ();
      if (((httpResponse.statusCode == HttpStatus.ok) ||
              (httpResponse.statusCode == HttpStatus.created) ||
              (httpResponse.statusCode == HttpStatus.accepted)) &&
          (httpResponse.data['status'] ?? false)) {
        if (httpResponse.data['data'] != null) {
          List<FAQModel> faqs = [];

          for (var item in httpResponse.data['data']) {
            faqs.add(FAQModel.fromJson(item));
          }

          return DataSuccess<List<FAQModel>>(faqs);
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

  Future<DataState<SettingsModel>>? fetchSettingsFAQUs() async {
    try {
      final httpResponse = await _faqApiServices.fetchFAQ();
      if (((httpResponse.statusCode == HttpStatus.ok) ||
              (httpResponse.statusCode == HttpStatus.created) ||
              (httpResponse.statusCode == HttpStatus.accepted)) &&
          (httpResponse.data['status'] ?? false)) {
        if (httpResponse.data['setting'] != null) {
          SettingsModel settingsModel = SettingsModel(
              phone: httpResponse.data['setting']['phone'],
              email: httpResponse.data['setting']['email']);

          return DataSuccess<SettingsModel>(settingsModel);
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

  Future<DataState<List<Contract>>>? fetchContract() async {
    try {
      final httpResponse = await _faqApiServices.fetchFAQ();
      if (((httpResponse.statusCode == HttpStatus.ok) ||
              (httpResponse.statusCode == HttpStatus.created) ||
              (httpResponse.statusCode == HttpStatus.accepted)) &&
          (httpResponse.data['status'] ?? false)) {
        if (httpResponse.data['contract'] != null) {
          List<Contract> contract = [];
          // log("jumper contract success $httpResponse");
          for (var item in httpResponse.data['contract']) {
            log("jumper contract data  $item \n");
            try {
              contract.add(Contract.fromJson(item));
            } catch (e) {
              log("jumper contract data error $e");
            }
          }
          log("jumper contract data ${contract.length}");
          return DataSuccess<List<Contract>>(contract);
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

  Future<DataState<ContactUsResponse>>? sendContactMessage(
      String name, String phone, String email, String message) async {
    try {
      final httpResponse =
          await _faqApiServices.sendContactMessage(name, phone, email, message);
      if (((httpResponse.statusCode == HttpStatus.ok) ||
              (httpResponse.statusCode == HttpStatus.created) ||
              (httpResponse.statusCode == HttpStatus.accepted)) &&
          (httpResponse.data['status'] ?? false)) {
        if (httpResponse.data['message'] != null) {
          ContactUsResponse contactUsResponse =
              ContactUsResponse.fromJson(httpResponse.data);
          return DataSuccess<ContactUsResponse>(contactUsResponse);
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
