import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Core/services/network/network_services.dart';

import 'firebase_constants.dart';

class SendNotificationService {
  static final NetworkService _networkService = Get.put(NetworkService());

  static Future<Response> sendNotification(
      {required String targetDeviceToken,
      required String title,
      required String text}) async {
    Response response;
    try {
      response = await _networkService.post(
        url: kFirebaseUrl,
        headers: {
          'Authorization': " key=$kServerKey",
          'Content-Type': "application/json",
        },
        body: {
          "to": targetDeviceToken,
          "data": {
            "title": title,
            'body': text,
            "click_action": "FLUTTER_NOTIFICATION_CLICK",
            'type': 'public'
          }
        },
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
