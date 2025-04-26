import 'package:dio/dio.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/services/network/api_names.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Core/services/network/network_services.dart';

class RefuseJobApiService with ApiNames {
  final NetworkService _networkService = NetworkService();

  Future<Response> refuse({
    required int jobID,
  }) async {
    Response response;

    try {
      response =
          await _networkService.post(url: uRLRefuseJob, auth: true, body: {
        "job_id": jobID,
      });
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
