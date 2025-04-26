import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/service_model.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/service/fetch_api_service.dart';

class FetchServicesRepository {
  final FetchServicesApiService _fetchServicesApiService =
      Get.put(FetchServicesApiService());

  Future<DataState<List<ServiceModel>>>? fetchServices() async {
    try {
      final httpResponse = await _fetchServicesApiService.fetchServices();
      log("HUN2${httpResponse.statusCode}");
      if (httpResponse.statusCode == HttpStatus.ok) {
        log("HUN3${httpResponse.statusCode}");
        if (httpResponse.data['data'] != null) {
          log("HUN4${httpResponse.statusCode}");
          List<ServiceModel> services = [];
          for (var item in (httpResponse.data['data'])) {
            log("service Model ${ServiceModel.fromMap(item)}");
            services.add(ServiceModel.fromMap(item));
          }
          log("HUN5${httpResponse.data}");
          // log("service Model ${services.length}");
          return DataSuccess<List<ServiceModel>>(services);
        } else {
          log("HUN6${httpResponse.statusCode}");
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
