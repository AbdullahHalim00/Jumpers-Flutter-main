import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jumper/src/Core/services/app_data/app_initializer.dart';
import 'package:jumper/src/Core/utils/utils.dart';

import 'firebase_options.dart';
import 'myApp.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// start background

// end background

// hello
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.getInitialMessage();

  await AppInitializer.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  // runApp(const DevicePreviewBuilder(myApp: MyApp()));
  String? token = await FirebaseMessaging.instance.getToken();
  // log("$token");
  runApp(const MyApp());
}

// hello

class LifecycleWatcher extends StatefulWidget {
  final Widget child;

  const LifecycleWatcher({Key? key, required this.child}) : super(key: key);

  @override
  LifecycleWatcherState createState() => LifecycleWatcherState();
}

class LifecycleWatcherState extends State<LifecycleWatcher>
    with WidgetsBindingObserver {
  AppLifecycleState? _lastLifecycleState;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _lastLifecycleState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_lastLifecycleState == null) {
      printDM("This widget has not observed any lifecycle changes.");
    }
    printDM(
        "The most recent lifecycle state this widget observed was: $_lastLifecycleState");

    return widget.child;
  }
}
