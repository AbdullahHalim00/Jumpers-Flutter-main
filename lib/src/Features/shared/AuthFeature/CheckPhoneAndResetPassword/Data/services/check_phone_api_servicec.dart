import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:jumper/src/Core/services/network/api_names.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Core/services/network/network_services.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CheckPhoneAndResetPassword/Data/params/check_phone_params.dart';

class CheckPhoneApiService with ApiNames {
  final NetworkService _networkService = Get.put(NetworkService());

  Future<Response> checkPhone({required CheckPhoneRequestParams params}) async {
    Response response;
    try {
      response = await _networkService.post(url: uRLCheckEmail, body: {
        'phone': params.phone,
      });
    } on SocketException {
      throw SocketException('No Internet Connection');
    } on Exception {
      throw UnKnownException('there is unKnown Exception');
    } catch (e) {
      throw UnKnownException(e.toString());
    }
    return response;
  }
}
