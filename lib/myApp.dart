import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/decorations/app_durations.dart';
import 'package:jumper/src/Core/constants/strings/app_strings.dart';
import 'package:jumper/src/Core/services/FCM/local_notification_service.dart';
import 'package:jumper/src/Core/services/Lang/localization_services.dart';
import 'package:jumper/src/Core/themes/themes.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/shared/SplashFeature/ui/screens/splash_imports.dart';
import 'package:jumper/src/Router/bindings.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Future<void> _firebaseMessagingBackgroundHandler(
        RemoteMessage message) async {
      print("Handling a background message: ${message.messageId}");
    }

    super.initState();
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // log("onMessage 1");
      LocalNotificationService.launchNotification(message: message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // log("onMessageOpenedApp 1");
      LocalNotificationService.launchNotification(message: message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      splitScreenMode: true,
      rebuildFactor: (mediaQueryData, mediaQueryData2) => true,
      designSize: const Size(375.0, 812.0),
      builder: (ctx, s) => GetMaterialApp(
        initialBinding: Binding(),
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        builder: DevicePreview.appBuilder,
        transitionDuration: AppDurations.mainTransition,
        defaultTransition: Transition.cupertino,
        // getPages: AppRoutes.getPages,
        title: AppStrings.appName,
        translations: LocalizationServices(),
        fallbackLocale: LocalizationServices.fallBackLocale,
        locale: Utils.cachedLocale,
        theme: Themes.lightTheme,
        themeMode: ThemeMode.light,
        home: const SplashScreen(),
      ),
    );
  }
}
