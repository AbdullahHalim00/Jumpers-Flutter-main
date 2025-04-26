import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:jumper/src/Core/utils/storage_util.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/shared/ChatsFeature/bloc/model/message_model.dart';

import '../../../../../Core/services/FirebaseChat/send_notification_servicec.dart';

class Chat {
  int? id; // user or group
  List<int>? ids;
  ChatType? chatType;
  bool jobEnded = false;
  String? chatId;
  String? name;
  String? image;
  DateTime? date;
  MessageModel? lastMessage;
  int? totalMessages;
  List<MessageModel>? messages;
  List<MessageModel>? apiMessages;
  bool? isOpened;
  List<SharedProperties>? sharedProperties;
  int? messageCount;

//<editor-fold desc="Chat">

  Chat({
    this.chatType,
    required this.jobEnded,
    this.id,
    this.ids,
    this.chatId,
    this.name,
    this.date,
    this.image,
    this.lastMessage,
    this.totalMessages,
    this.messages,
    this.apiMessages,
    this.isOpened,
    this.messageCount = 0,
    this.sharedProperties,
  });

  @override
  String toString() {
    return 'Chat{ chat_type: $chatType, jobEnded: $jobEnded, id: $id, ids: $ids, chat_id: $chatId, date: $date, name: $name, image: $image, last_message: $lastMessage, totalMessages: $totalMessages, messages: $messages, api_messages: $apiMessages, isOpened: $isOpened, message_count: $messageCount, shared_properties: $sharedProperties}';
  }

  Chat copyWith({
    ChatType? chatType,
    required bool jobEnded,
    int? id,
    List<int>? ids,
    String? chatId,
    DateTime? date,
    String? name,
    String? image,
    MessageModel? lastMessage,
    List<MessageModel>? messages,
    List<MessageModel>? apiMessages,
    int? totalMessages,
    bool? isOpened = false,
    int? messageCount,
    List<SharedProperties>? sharedProperties,
  }) {
    return Chat(
      chatType: chatType ?? this.chatType,
      jobEnded: jobEnded,
      id: id ?? this.id,
      ids: ids ?? this.ids,
      chatId: chatId ?? this.chatId,
      date: date ?? this.date,
      name: name ?? this.name,
      image: image ?? this.image,
      lastMessage: lastMessage ?? this.lastMessage,
      totalMessages: totalMessages ?? this.totalMessages,
      messages: messages ?? this.messages,
      apiMessages: apiMessages ?? this.apiMessages,
      isOpened: isOpened ?? this.isOpened,
      messageCount: messageCount ?? this.messageCount,
      sharedProperties: sharedProperties ?? this.sharedProperties,
    );
  }

  Map<String, dynamic> toJson() {
    final localUser = DataBase().restoreUserModel();
    return {
      'chat_type': _chatTypeToInt(chatType!),
      'job_ended': jobEnded,
      'id': id,
      'ids': sharedProperties!.map((e) => e.id).toList(),
      'chat_id': chatId,
      'date': date,
      'user_name': name,
      'image': image,
      'last_message': lastMessage?.toJson(),

      "first_user_id": localUser.id,
      "second_user_id": id,
      "first_user_image": localUser.image,
      "second_user_image": image,
      "first_user_name": localUser.name,
      "second_user_name": name,
      "message_count": messageCount,
      "shared_properties": sharedProperties!.map((e) => e.toJson()).toList(),

      // 'totalMessages': totalMessages,
      // 'messages': messages,
      // 'api_messages': apiMessages,
      // 'isOpened': isOpened,
    };
  }

  _handleUser(Map<String, dynamic> map) {
    if (0 == 0) {
      // if (chatType == ChatType.user) {
      _handleUserChat(map);
    } else {
      _handleGroupChat(map);
    }
  }

  _handleUserChat(Map<String, dynamic> map) {
    if (map['first_user_id'] != null) {
      final myID = DataBase().restoreUserModel().id;
      if (myID == map['first_user_id']) {
        id = map['second_user_id'] ?? 0;
        name = map['second_user_name'] ?? "ssss";
        image = map['second_user_image'] ?? "";
      } else {
        id = map['first_user_id'] ?? 0;
        name = map['first_user_name'] ?? "";
        image = map['first_user_image'] ?? "";
      }
    }
  }

  _handleGroupChat(Map<String, dynamic> map) {
    id = map['first_user_id'] ?? 0;
    name = map['first_user_name'] ?? "";
    image = map['first_user_image'] ?? "";
  }

  Chat.fromJson(Map<String, dynamic> map) {
    /// *********************** Chat **************************
    _handleUser(map);
    // ids = map['ids'] != null ?List.from(map['ids']) : [];
    ids = map['ids'] != null
        ? List<int>.from(map["ids"].map((x) => x)).toList()
        : [];
    printDM("Chat ids => $ids");

    chatType = _getChatType(map['chat_type'] ?? 0);
    printDM("Chat chatType => $chatType");
    // date = map['date']??DateTime.now();
    // date =HttpDate.parse(map['date'].toString())??DateTime.now();
    date = map['date'] != null ? map['date'].toDate() : DateTime.now();
    printDM("Chat chat Date => ${map['date']}");

    printDM("Chat date => $date");
    chatId = map['chat_id'] ?? "";
    printDM("Chat chatId => $chatId");

    jobEnded = map['job_ended'] ?? false;
    printDM("Chat jobEnded => $jobEnded");

    messageCount = map['message_count'] ?? 0;
    printDM("Chat messageCount => $messageCount");
    lastMessage = map['last_message'] != null
        ? MessageModel.fromJson(map['last_message'])
        : MessageModel(
            message: "Say Hi to $name ! ",
            userId: 0,
            userName: "",
            userImage: "",
            chatId: "0",
            date: "",
            messageId: '',
            seenStatus: SeenStatus.notSeen);
    printDM("Chat lastMessage => $lastMessage");

    totalMessages = map['totalMessages'] ?? 0;
    printDM("Chat totalMessages => $totalMessages");

    messages = [];
    printDM("Chat messages => $messages");
    apiMessages = [];
    printDM("Chat apiMessages => $apiMessages");

    // isOpened = false;
    printDM("Chat isOpened => $isOpened");
    sharedProperties = map['shared_properties'] != null
        ? List.from(map['shared_properties'])
            .map((x) => SharedProperties.fromMap(x))
            .toList()
        : [];
    printDM("Chat sharedProperties => $sharedProperties");

    /// *********************** ************ **************************
  }

  String getToken({required int id}) {
    String token = '';
    int index = sharedProperties!.map((e) => e.id).toList().indexOf(id);
    if (index != -1) {
      token = sharedProperties![index].token!;
    }
    return token;
  }

  int get getMyMessageCount {
    final myID = DataBase().restoreUserModel().id;
    int count = 0;
    int index = sharedProperties!.map((e) => e.id).toList().indexOf(myID);
    if (index != -1) {
      count = sharedProperties![index].messageCount!;
    }
    return count;
  }

  void increaseMessageCount() {
    final myID = DataBase().restoreUserModel().id;
    for (var e in sharedProperties!) {
      if (e.id != myID) {
        e.messageCount = e.messageCount! + 1;
      }
    }
  }

  void clearMyMessageCount() {
    final myID = DataBase().restoreUserModel().id;
    int index = sharedProperties!.map((e) => e.id).toList().indexOf(myID);
    if (index != -1) {
      sharedProperties![index].messageCount = 0;
    }
  }

  void sendNotification({String message = ''}) {
    final db = DataBase().restoreUserModel();
    final myID = db.id;
    final myName = db.name;
    for (var element in sharedProperties ?? []) {
      if (element.id != myID) {
        SendNotificationService.sendNotification(
          targetDeviceToken: element.token ?? '',
          title: 'new_message_from'.trParams({
            'name': myName,
          }),
          text: message,
        );
      }
    }
  }

//</editor-fold>
}

ChatType _getChatType(int id) {
  switch (id) {
    case 1:
      return ChatType.user;
    case 2:
      return ChatType.group;
    default:
      return ChatType.user;
  }
}

int _chatTypeToInt(ChatType type) {
  switch (type) {
    case ChatType.user:
      return 0;
    case ChatType.group:
      return 1;
  }
}

enum ChatType {
  user("user"),
  group("group");

  const ChatType(this.value);

  final String value;
}

class SharedProperties {
  int? id;

  String? token;

  int? messageCount;

//<editor-fold desc="Data Methods">

  SharedProperties({
    this.id,
    this.token,
    this.messageCount,
  });

  @override
  String toString() {
    return 'SharedChatData{ id: $id, token: $token, message_count: $messageCount,}';
  }

  SharedProperties copyWith({
    int? id,
    String? token,
    int? messageCount,
  }) {
    return SharedProperties(
      id: id ?? this.id,
      token: token ?? this.token,
      messageCount: messageCount ?? this.messageCount,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'token': token,
      'message_count': messageCount,
    };
  }

  SharedProperties.fromMap(Map<String, dynamic> map) {
    id = map['id'] ?? 0;
    token = map['token'] ?? "";
    messageCount = map['message_count'] ?? 0;
  }

//</editor-fold>
}
