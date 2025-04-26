import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:jumper/src/Core/services/Downloader/DownloaderService.dart';

import '../../utils/storage_util.dart';
import '../FCM/fcm_service.dart';
import '../FCM/local_notification_service.dart';
import 'app_data.dart';

/// Contains All The Methods needed to be run before MyApp Compiles
class AppInitializer {
  AppInitializer._();

  static final LocalNotificationService _localNotificationService =
      LocalNotificationService();

  static Future<void> initializeApp() async {
    // await AndroidAlarmManager.initialize();

    WidgetsFlutterBinding.ensureInitialized();
    //* deprecated
    // if (defaultTargetPlatform == TargetPlatform.android) {
    //       AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
    //     }
    final GoogleMapsFlutterPlatform mapsImplementation =
        GoogleMapsFlutterPlatform.instance;
    if (mapsImplementation is GoogleMapsFlutterAndroid) {
      mapsImplementation.useAndroidViewSurface = true;
    }
    await DownloaderService.init();
    await Firebase.initializeApp();
    await GetStorage.init();
    // await Firebase.initializeApp();
    await AppData.getDeviceID();
    await AppData.fixedOrientation();
    // AppData.hideStatusBar();
    await Get.put(DataBase()).initStorage();
    // Start Handle FCM config
    _localNotificationService.localNotificationConfiguration();

    /// * On notification success * ///

    FCMService.firebaseNotificationConfiguration();
    // End Handle FCM config
  }
}
