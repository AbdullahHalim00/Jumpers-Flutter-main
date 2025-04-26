import 'dart:io';

import 'package:get/get.dart';
import 'package:jumper/src/Bloc/Data/Services/fetch_cities_api_servicec.dart';
import 'package:jumper/src/Bloc/models/simple_model.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Core/utils/utils.dart';

class FetchCitiesRepository {
  final FetchCitiesApiService _fetchCitiesApiService =
      Get.put(FetchCitiesApiService());

  Future<DataState<List<SimpleModel>>>? fetchCities() async {
    try {
      final httpResponse = await _fetchCitiesApiService.fetchCities();
      if (((httpResponse.statusCode == HttpStatus.ok) ||
              (httpResponse.statusCode == HttpStatus.created) ||
              (httpResponse.statusCode == HttpStatus.accepted)) &&
          (httpResponse.data['status'] ?? false)) {
        if (httpResponse.data['data'] != null) {
          List<SimpleModel> listOfData = [];
          // SimpleModel data = SimpleModel.fromMap(httpResponse.data['data']);
          printDM(
              "httpResponse.data['data'] in FetchCitiesRepository is ${httpResponse.data['data']}");
          for (var item in httpResponse.data['data']) {
            printDM("enter hear 1");
            listOfData.add(SimpleModel.fromJson(item));
            printDM("enter hear 2");
          }
          return DataSuccess<List<SimpleModel>>(listOfData);
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
          errorTitle: 'There is Internet Error',
          errorType: ErrorType.networkConnection));
    } on ServerSideException {
      return DataFailed(
          ErrorModel(errorTitle: '', errorType: ErrorType.serverSide));
    } on UnKnownException {
      return DataFailed(
          ErrorModel(errorTitle: '', errorType: ErrorType.unKnown));
    } catch (e) {
      return DataFailed(
          ErrorModel(errorTitle: '$e', errorType: ErrorType.unKnown));
    }
  }
}
