import 'package:dio/dio.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/services/network/api_names.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Core/services/network/network_services.dart';
import 'package:jumper/src/Core/utils/utils.dart';

class FetchCompanyStaticsApiService with ApiNames {
  final NetworkService _networkService = NetworkService();

  Future<Response> fetchCompanyStatics() async {
    Response response;

    try {
      response = await _networkService.get(
        url: uRLCompanyStatics,
        auth: true,
      );
    } on NetworkDisconnectException {
      throw NetworkDisconnectException(networkDisconnectException);
    } on ServerSideException {
      throw ServerSideException(serverSideException);
    } on UnKnownException {
      throw UnKnownException(unKnownException);
    } catch (e) {
      throw UnKnownException(e.toString());
    }
    printDM("CompanyStatics2 ${response.data.toString()}  ");

    return response;
  }
}
