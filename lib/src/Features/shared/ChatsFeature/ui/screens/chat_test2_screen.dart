import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jumper/src/Core/utils/storage_util.dart';
import 'package:pusher_client/pusher_client.dart';

class ChatScreenTest2 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<ChatScreenTest2> {
  late PusherClient pusher;
  late Channel channel;

  @override
  void initState() {
    super.initState();

    String token = getToken();
    DataBase dataBase = DataBase();
    pusher = new PusherClient(
      "d3de6d2e7eb78cff0e49",
      PusherOptions(
        cluster: "mt1",
        // if local on android use 10.0.2.2
        encrypted: false,
        auth: PusherAuth(
          'https://jumpersksa.com/api/pusher-auth',
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${dataBase.restoreUserModel().apiToken}'
          },
        ),
      ),
      enableLogging: true,
    );

    log("TOKEN" + dataBase.restoreUserModel().apiToken);
    channel = pusher.subscribe("private-chatify");

    pusher.onConnectionStateChange((state) {
      log("previousState: ${state!.previousState}, currentState: ${state.currentState}");
    });

    pusher.onConnectionError((error) {
      log("error: ${error!.message}");
    });

    channel.bind('send', (event) {
      log(event!.data.toString());
    });

    // channel.bind('order-filled', (event) {
    //   log("Order Filled Event" + event!.data.toString());
    // });
  }

  String getToken() => "super-secret-token";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Example Pusher App'),
        ),
        body: Center(
            child: Column(
          children: [
            ElevatedButton(
              child: Text('Unsubscribe private-chatify'),
              onPressed: () {
                pusher.unsubscribe('private-chatify');
              },
            ),
            ElevatedButton(
              child: Text('Unbind Status Update'),
              onPressed: () {
                channel.unbind('send');
              },
            ),
            ElevatedButton(
              child: Text('Unbind Order Filled'),
              onPressed: () {
                // channel.unbind('order-filled');
              },
            ),
            ElevatedButton(
              child: Text('Bind Status Update'),
              onPressed: () {
                channel.bind('status-update', (PusherEvent? event) {
                  log("Status Update Event" + event!.data.toString());
                });
              },
            ),
            ElevatedButton(
              child: Text('Trigger Client Typing'),
              onPressed: () {
                channel.trigger('send', {'name': 'Bob'});
              },
            ),
          ],
        )),
      ),
    );
  }
}
