import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/services/network/api_names.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Core/services/network/network_services.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/params/fetch_work_type_params.dart';

class FetchWorkTypeApiService with ApiNames {
  final NetworkService _networkService = Get.put(NetworkService());

  Future<Response> fetchWorkType(
      {required FetchWorkTypeParameters parameters}) async {
    Response response;
    log("HUN" + parameters.serviceId.toString());
    try {
      response = await _networkService.post(url: uRLFetchWorkTypes, body: {
        "service_id": parameters.serviceId,
      });

      log("HUN" + response.data.toString());
    } on NetworkDisconnectException {
      throw NetworkDisconnectException(networkDisconnectException);
    } on ServerSideException {
      throw ServerSideException(serverSideException);
    } on UnKnownException {
      throw UnKnownException(unKnownException);
    } catch (e) {
      throw UnKnownException(e.toString());
    }
    return response;
  }
}
