import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/decorations/app_durations.dart';
import 'package:jumper/src/Features/shared/welcome/ui/screens/imports_welcome.dart';

class AppData {
  AppData._();

  static AppData appData = AppData._();

  /// Fix Orientation
  static Future<void> fixedOrientation() {
    List<DeviceOrientation> _orientations = [DeviceOrientation.portraitUp];
    return SystemChrome.setPreferredOrientations(_orientations);
  }

  /// hide status bar
  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
        overlays: []);
  }

  /// Shows status bar
  static Future<void> showStatusBar() =>
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);

  /// Device target platform
  static String getOs() => Platform.operatingSystem;

  /// App controller haptic touch onButtonPressed
  static Future<void> applyHapticFeedback({bool vibration = false}) async {
    if (vibration) {
      await HapticFeedback.vibrate();
    } else {
      await HapticFeedback.heavyImpact();
    }
  }

  /// Device Info
  static Future<String> getDeviceID() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String deviceId;
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      debugPrint(
          'Running on ${androidInfo.model} ${androidInfo.id} ${androidInfo.type}'); // e.g. "Moto G (4)"
      deviceId = "${androidInfo.model} ${androidInfo.id}";
    } else if (Platform.isIOS) {
      // IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      // print('Running on ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"
      deviceId = "no data yet";

      /// implementation must be added
    } else {
      deviceId = "no data yet";
    }
    return deviceId;
  }

  /// [controlFlow] manipulates the return Screen  ( Called before the app runs or in Splash Screen )
  static void controlFlow() {
    Get.offAll(
      () => const WelcomeScreen(),
      transition: Transition.fade,
      duration: AppDurations.mainTransition,
    );
  }
}
