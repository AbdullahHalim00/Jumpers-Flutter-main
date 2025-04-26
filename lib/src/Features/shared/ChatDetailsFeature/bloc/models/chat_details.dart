// import 'package:flutter/material.dart';
// import 'package:jumper/src/Core/constants/colors/app_colors.dart';
//
// class ChatDetails {
//     final  int id ;
//     final String message ;
//      final String senderLabel ;
//     final bool isSender ;
//     final Widget seenIcon ;
//     final String date ;
//
// //<editor-fold desc="Data Methods">
//
//   const ChatDetails( {
//     required this.id,
//     required this.message,
//     required this.senderLabel,
//     required this.isSender,
//     required this.seenIcon,
//     required this.date,
//   });
//
//   @override
//   String toString() {
//     return 'ChatDetails{' +
//         ' id: $id,' +
//         ' message: $message,' +
//         ' senderLabel: $senderLabel,' +
//         ' isSender: $isSender,' +
//         ' seenIcon: $seenIcon,' +
//         '}';
//   }
//
//
//   factory ChatDetails.fromMap(Map<String, dynamic> map) {
//     return ChatDetails(
//       id: map['id'] ??0,
//       message: map['message'] ??"",
//       senderLabel: map['senderLabel'] ??"",
//       isSender: map['isSender'] ??false,
//       seenIcon: getSeenStatusIcon( map['seenIcon'] ?? 0),
//       date: map["date"]??"",
//     );
//   }
//
// //</editor-fold>
// }
