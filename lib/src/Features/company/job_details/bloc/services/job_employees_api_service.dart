import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/services/network/api_names.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Core/services/network/network_services.dart';

class JobEmployeesApiService with ApiNames {
  final NetworkService _networkService = NetworkService();

  Future<Response> fetchEmployees(int jobID) async {
    Response response;

    try {
      response = await _networkService
          .post(url: uRLJobEmployees, auth: true, body: {"job_id": jobID});

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
