import 'package:dio/dio.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:jumper/src/Core/services/network/api_names.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Core/services/network/network_services.dart';
import 'package:jumper/src/Core/utils/utils.dart';

class FAQApiServices with ApiNames {
  final NetworkService _networkService = NetworkService();

  Future<Response> fetchFAQ() async {
    Response response;
    try {
      response = await _networkService.get(
        url: uRLFaq,
        auth: true,
      );
      printDM("is this contract HUNTER$response");
    } on NetworkDisconnectException {
      throw NetworkDisconnectException('no_internet_connection'.tr);
    } on UnKnownException {
      throw UnKnownException('there_is_unKnown_exception'.tr);
    } catch (e) {
      throw UnKnownException(e.toString());
    }
    return response;
  }

  Future<Response> sendContactMessage(
    String name,
    String phone,
    String email,
    String message,
  ) async {
    Response response;
    try {
      response = await _networkService.post(
        url: uRLContactUs,
        body: {
          'name': name,
          'phone': phone,
          'email': email,
          'message': message
        },
        auth: true,
      );
      printDM("HUNTER$response");
    } on NetworkDisconnectException {
      throw NetworkDisconnectException('no_internet_connection'.tr);
    } on UnKnownException {
      throw UnKnownException('there_is_unKnown_exception'.tr);
    } catch (e) {
      throw UnKnownException(e.toString());
    }
    return response;
  }
}
