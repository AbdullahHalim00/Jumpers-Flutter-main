import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DevicePreviewBuilder extends StatelessWidget {
  final Widget myApp;

  /// ..... Relays on : device_preview package ..... remember to add both of these lines in your materialApp :
  /// 1. useInheritedMediaQuery: true,
  /// 2. builder: DevicePreview.appBuilder,
  /// 3. if no locale => locale: DevicePreview.locale(context),
  const DevicePreviewBuilder({required this.myApp, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => myApp, // Wrap your app
    );
  }
}
