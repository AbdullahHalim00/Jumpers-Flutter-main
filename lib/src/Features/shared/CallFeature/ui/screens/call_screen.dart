import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Ui/appbars/default_appbar.dart';
import 'package:jumper/src/Ui/builders/unavailable_builder.dart';
import 'package:jumper/src/Ui/scaffold/default_scaffold.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: AppBars.basic(
        title: "call".tr,
        isBack: true,
      ),
      body: UnAvailableBuilder(
        child: Container(),
      ),
    );
  }
}
