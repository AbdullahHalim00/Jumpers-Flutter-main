import 'dart:io';

import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/title_model.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/service/fetch_api_languages.dart';

class FetchLanguagesRepository {
  final FetchLanguagesApiService _fetchLanguagesApiService =
      Get.put(FetchLanguagesApiService());

  Future<DataState<List<TitleModel>>>? fetchLanguages() async {
    try {
      final httpResponse = await _fetchLanguagesApiService.fetchLanguages();
      if (((httpResponse.statusCode == HttpStatus.ok) ||
              (httpResponse.statusCode == HttpStatus.created) ||
              (httpResponse.statusCode == HttpStatus.accepted)) &&
          (httpResponse.data['status'] ?? false)) {
        if (httpResponse.data['data'] != null) {
          printDM(
              "httpResponse.data['data'] in FetchLanguagesRepository is ${httpResponse.data['data']}");

          List<TitleModel> languages = [];
          for (var item in httpResponse.data['data']) {
            languages.add(TitleModel.fromJson(item));
          }
          printDM("lang ${languages.length}");
          return DataSuccess<List<TitleModel>>(languages);
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
