import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:jumper/src/Core/services/network/api_names.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Core/services/network/network_services.dart';
import 'package:jumper/src/Features/shared/AuthFeature/Verfication/Data/params/check_code_params.dart';

class CheckCodeApiService with ApiNames {
  final NetworkService _networkService = Get.put(NetworkService());

  Future<Response> checkCode({required CheckCodeRequestParams params}) async {
    Response response;
    try {} catch (e) {
      print('an error occur in fetch token');
    }
    try {
      response = await _networkService.post(url: uRLCheckCode, body: {
        'phone': params.phone,
        'code': params.code,
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
