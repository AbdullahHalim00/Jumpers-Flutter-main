import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Bloc/controllers/badge_counter_controller.dart';
import 'package:jumper/src/Core/services/FCM/local_notification_service.dart';
import 'package:jumper/src/Core/utils/utils.dart';

class FCMService {
  static late final FirebaseMessaging _messaging;

  static Future<String?> get deviceToken async {
    final FirebaseMessaging _fcm = FirebaseMessaging.instance;
    String? deviceToken = '';
    try {
      deviceToken = await _fcm.getToken();
    } catch (e) {
      printDM('an error occur in fetch token');
    }
    printDM("device Token is => $deviceToken");
    return deviceToken;
  }

  static void firebaseNotificationConfiguration(
      {VoidCallback? onNotificationSent}) async {
    _messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        printDM("notification message.notification1 is >>> ${message.data}");
        LocalNotificationService.launchNotification(message: message);
        // onNotificationSent!();
        /// on success
        
        if(/*message.data[''] == */ true){
          final NotificationBadgeController numbersController = Get.find();
          numbersController.increaseCounts();
        }else{
          final MessageBadgeController numbersMsgCtrl = Get.find();
          numbersMsgCtrl.increaseCounts();
        }

        /// ----------
      });
    } else {
      printDM("permission declined by user");
    }
  }
}
