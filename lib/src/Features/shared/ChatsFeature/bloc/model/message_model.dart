import 'package:jumper/src/Core/utils/utils.dart';

class MessageModel {
  // int? id;
  int? userId;
  String? userName;
  String? userImage;
  String? message;
  String? chatId;
  String? messageId;
  String? date;
  SeenStatus? seenStatus;

//<editor-fold desc="Message">

  MessageModel({
    // this.id,
    this.userId,
    this.userName,
    this.userImage,
    this.message,
    this.chatId,
    this.messageId,
    this.date,
    this.seenStatus,
  });

  @override
  String toString() =>
      'Message{ from_id: $userId, user_name: $userName, user_image: $userImage, message: $message, chat_id: $chatId, id: $messageId, time: $date, seen_status: $seenStatus,}';

  MessageModel copyWith({
    int? userId,
    String? userName,
    String? userImage,
    String? message,
    String? chatId,
    String? messageId,
    String? date,
    SeenStatus? seenStatus,
  }) {
    return MessageModel(
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userImage: userImage ?? this.userImage,
      message: message ?? this.message,
      messageId: messageId ?? this.messageId,
      chatId: chatId ?? this.chatId,
      date: date ?? this.date,
      seenStatus: seenStatus ?? this.seenStatus,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      'from_id': userId,
      'user_name': userName,
      'user_image': userImage,
      'message': message,
      'chat_id': chatId,
      'id': messageId,
      'time': date,
      'seen_status': _seenStatusToInt(seenStatus ?? SeenStatus.notSeen),
    };
  }

  MessageModel.fromJson(Map<String, dynamic> map, {String? messageId}) {
    /// *********************** Message **************************
    // id = map['id'] ?? 0;
    // printDM("MessageModel id => $id");
    userId = map['from_id'] ?? 0;
    printDM("MessageModel userId => $userId");
    userName = map['user_name'] ?? "";
    printDM("MessageModel userName => $userName");
    userImage = map['user_image'] ?? "";
    printDM("MessageModel userImage => $userImage");
    message = map['message'] ?? "";
    printDM("MessageModel message => $message");
    chatId = map['chat_id'] ?? "";
    printDM("MessageModel chatId => $chatId");
    messageId = messageId ?? map['message_id'] ?? '';
    printDM("MessageModel id => $messageId");
    date = map['time'] ?? "";
    printDM("MessageModel date => $date");
    seenStatus = _getSeenStatus(map['seen_status'] ?? 0);
    printDM("MessageModel seenStatus => $seenStatus");

    /// *********************** ************ **************************
  }

//</editor-fold>
}

SeenStatus _getSeenStatus(int id) {
  switch (id) {
    case 0:
      return SeenStatus.notSent;
    case 1:
      return SeenStatus.delivered;
    case 2:
      return SeenStatus.notSeen;
    case 3:
      return SeenStatus.seen;
    default:
      return SeenStatus.notSent;
  }
}

int _seenStatusToInt(SeenStatus status) {
  switch (status) {
    case SeenStatus.notSent:
      return 0;
    case SeenStatus.delivered:
      return 1;
    case SeenStatus.notSeen:
      return 2;
    case SeenStatus.seen:
      return 3;
    default:
      return 0;
  }
}

enum SeenStatus {
  seen,
  delivered,
  notSeen,
  notSent,
}
