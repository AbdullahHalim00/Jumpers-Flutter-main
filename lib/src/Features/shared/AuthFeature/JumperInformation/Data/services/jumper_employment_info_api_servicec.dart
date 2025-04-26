import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:jumper/src/Core/services/network/api_names.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Core/services/network/network_services.dart';
import 'package:jumper/src/Features/shared/AuthFeature/JumperInformation/Data/params/jumper_employment_info_params.dart';

class JumperEmploymentInfoApiService with ApiNames {
  final NetworkService _networkService = Get.put(NetworkService());

  Future<Response> enterJumperEmploymentInfo(
      {required JumperEmploymentInfoRequestParams params}) async {
    Response response;
    try {
      response = await _networkService.post(
        url: uRLSetJumperEmploymentInfo,
        auth: true,
        body: await params.toMap(),
        requestTimeOut: 600 * 1000,
      );
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
