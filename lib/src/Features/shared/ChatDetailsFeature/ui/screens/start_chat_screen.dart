// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:jumper/src/Features/shared/ChatDetailsFeature/bloc/controller/start_chat_controller.dart';
// import 'package:jumper/src/Ui/loading/loading_box.dart';
//
// class StartChatScreen extends StatelessWidget {
//   final String targetName;
//   final int targetID;
//   final String targetImage;
//
//   const StartChatScreen({Key? key, required this.targetName, required this.targetID, required this.targetImage, }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final StartChatController _startChatController = Get.put(StartChatController(targetName: targetName, targetID: targetID, targetImage: targetImage));
//     return GetBuilder<StartChatController>(
//       init: _startChatController,
//         builder: (_) {
//       return const Scaffold(
//         body: LoadingBox(),
//       );
//     });
//   }
// }
