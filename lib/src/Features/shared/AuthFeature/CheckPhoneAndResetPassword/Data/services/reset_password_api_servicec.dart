import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:jumper/src/Core/services/network/api_names.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Core/services/network/network_services.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CheckPhoneAndResetPassword/Data/params/reset_password_params.dart';

class ResetPasswordApiService with ApiNames {
  final NetworkService _networkService = Get.put(NetworkService());

  Future<Response> resetPassword(
      {required ResetPasswordRequestParams params}) async {
    Response response;
    try {
      response = await _networkService.post(url: uRLResetPassword, body: {
        'email': params.email,
        'password': params.password,
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
