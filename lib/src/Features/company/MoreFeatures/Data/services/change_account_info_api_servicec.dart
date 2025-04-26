import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jumper/src/Core/services/network/api_names.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Core/services/network/network_services.dart';
import 'package:jumper/src/Features/company/MoreFeatures/Data/params/change_account_info_params.dart';

class ChangeAccountInfoApiService with ApiNames {
  final NetworkService _networkService = NetworkService();

  Future<Response> changeAccountInfo(
      {required ChangeAccountInfoRequestParams params}) async {
    Response response;
    try {
      response = await _networkService
          .post(auth: true, url: uRLEditAccountName, body: {
        'name': params.name,
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
