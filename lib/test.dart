// void ddd (){
//   bool isContained =
//   _chats.map((e) => e.chatId).toList().contains(chat.chatId);
//   if (!isContained) {
//     if (chat.lastMessage!.messageId != null) {
//       chat.messageCount = 1;
//     }
//     _chats.insert(0, chat);
//   } else {
//     printDM("22 ASAaslmALDJAEJFKLHQEKLHGJHJKhggn");
//     int chatIndex = _chats.indexWhere((e) => e.chatId == chat.chatId);
//     if (chatIndex != -1) {
//       MessageModel loadedMessage = _chats[chatIndex].lastMessage!;
//       _chats[chatIndex] = _chats[chatIndex].copyWith(
//         lastMessage: chat.lastMessage,
//         date: DateTime.tryParse(chat.date.toString()),
//         messageCount: chat.messageCount,
//         //     (loadedMessage.messageId) != (chat.lastMessage!.messageId)
//         //         ? (_chats[chatIndex].messageCount! +1)
//         //         : _chats[chatIndex].messageCount,
//       );
//       update();
//       printDM(
//           "A7aaaaaaaaaaaaa Messages Count ${_chats[chatIndex].messageCount} loadedMessage.messageId ${loadedMessage.messageId}+chat.lastMessage!.messageId ${chat.lastMessage!.messageId}");
//     }
//   }
// }
//
