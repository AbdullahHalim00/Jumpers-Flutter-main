import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:jumper/src/Core/services/network/api_names.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Core/services/network/network_services.dart';

class FetchSectorsApiService with ApiNames {
  final NetworkService _networkService = Get.put(NetworkService());

  Future<Response> fetchSectors() async {
    Response response;
    try {
      response = await _networkService.get(
        url: uRLSectors,
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
