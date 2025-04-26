import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jumper/src/Core/services/network/api_names.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Core/services/network/network_services.dart';
import 'package:jumper/src/Features/company/MoreFeatures/Data/params/change_password_params.dart';

class ChangePasswordApiService with ApiNames {
  final NetworkService _networkService = NetworkService();

  Future<Response> changePassword(
      {required ChangePasswordRequestParams params}) async {
    Response response;
    try {
      response =
          await _networkService.post(auth: true, url: uRLChangePassword, body: {
        'old_password': params.oldPassword,
        'new_password': params.newPassword,
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
