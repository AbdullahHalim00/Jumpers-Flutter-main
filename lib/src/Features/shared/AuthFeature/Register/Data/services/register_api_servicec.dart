import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jumper/src/Core/services/network/api_names.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Core/services/network/network_services.dart';
import 'package:jumper/src/Features/shared/AuthFeature/Register/Data/params/register_params.dart';

class RegisterApiService with ApiNames {
  // GetStorage box = GetStorage();
  final NetworkService _networkService = NetworkService();

  // final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  Future<Response> register({required RegisterRequestParams params}) async {
    Response response;
    try {
      response = await _networkService.post(url: uRLRegister, body: {
        'name': params.name,
        'phone': params.phone,
        'email': params.email,
        'password': params.password,
        'type': params.accType,
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
