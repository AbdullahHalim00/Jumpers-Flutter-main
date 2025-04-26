import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:jumper/src/Core/services/network/api_names.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Core/services/network/network_services.dart';
import 'package:jumper/src/Features/shared/AuthFeature/login/Data/params/login_params.dart';

class LoginApiService with ApiNames {
  final NetworkService _networkService = NetworkService();

  Future<Response> login({required LoginRequestParams params}) async {
    Response response;
    try {
      // log("HUN"+params.phone);
      // log("HUN"+params.password);
      // log("HUN"+params.deviceToken.toString());
      // log("HUN"+params.deviceId.toString());
      response = await _networkService
          .post(url: "https://jumpersksa.com/api/login", body: {
        'phone': params.phone,
        'password': params.password,
        'device_token': params.deviceToken,
        'device_id': params.deviceId,
      });
      log("HUN" + params.deviceToken.toString());
      log("HUN" + response.data.toString());

      log('HUN' + response.data.toString());
    } on NetworkDisconnectException {
      throw NetworkDisconnectException('No Internet Connection');
    } on ServerSideException {
      throw ServerSideException('Server Side Exception');
    } on UnKnownException {
      throw UnKnownException('There Is UnKnown Exception');
    } catch (e) {
      throw UnKnownException(e.toString());
    }
    return response;
  }
}
