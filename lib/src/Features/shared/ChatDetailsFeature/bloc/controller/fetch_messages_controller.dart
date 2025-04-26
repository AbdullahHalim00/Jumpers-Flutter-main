import 'dart:convert';
import 'dart:developer';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jumper/src/Bloc/models/FetchMessageResponse.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/utils/storage_util.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/shared/ChatDetailsFeature/bloc/Repo/fetch_messages_repo.dart';
import 'package:jumper/src/Features/shared/ChatsFeature/bloc/controller/chats_controller.dart';
import 'package:jumper/src/Features/shared/ChatsFeature/bloc/model/chat.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

import '../../../../../Bloc/models/MessagePusherResponse.dart';
import '../Parameters/fetch_messages_params.dart';
import '../Parameters/send_message_parameters.dart';

class FetchMessagesController extends GetxController {
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();

  void onConnectPressed() async {
    try {
      await pusher.init(
          apiKey: "d3de6d2e7eb78cff0e49",
          cluster: "mt1",
          onConnectionStateChange: onConnectionStateChange,
          onError: onError,
          onSubscriptionSucceeded: onSubscriptionSucceeded,
          onEvent: onEvent,
          onSubscriptionError: onSubscriptionError,
          onDecryptionFailure: onDecryptionFailure,
          onMemberAdded: onMemberAdded,
          onMemberRemoved: onMemberRemoved,
          onSubscriptionCount: onSubscriptionCount,
          authEndpoint: "https://jumpersksa.com/api/pusher-auth",
          onAuthorizer: onAuthorizer);
      await pusher.subscribe(channelName: "private-chatify");
      await pusher.connect();
    } catch (e) {
      log("ERROR: $e");
    }
  }

  void onConnectionStateChange(dynamic currentState, dynamic previousState) {
    log("Connection: $currentState");
  }

  void onError(String message, int? code, dynamic e) {
    log("onError: $message code: $code exception: $e");
  }

  void onEvent(PusherEvent event) {
    // if (event.eventName == "messagingu") {
    //   log("onEvent: $event");
    // }
    try {
      MessagePusherResponse m =
          MessagePusherResponse.fromJson(jsonDecode(event.data));

      dataState.data!.add(
        Messages(
          id: 0,
          fromId: m.fromId.toString(),
          time: "",
          toId: m.toId.toString(),
          message: m.message,
        ),
      );

      update();
      log("LENGTH${dataState.data!.length}");

      log(m.message.toString());
    } catch (e) {
      log("ERROR$e");
    }

    log("onEvent: $event");
  }

  void onSubscriptionSucceeded(String channelName, dynamic data) {
    log("onSubscriptionSucceeded: $channelName data: $data");
    final me = pusher.getChannel(channelName)?.me;
    log("Me: $me");
  }

  void onSubscriptionError(String message, dynamic e) {
    log("onSubscriptionError: $message Exception: $e");
  }

  void onDecryptionFailure(String event, String reason) {
    log("onDecryptionFailure: $event reason: $reason");
  }

  void onMemberAdded(String channelName, PusherMember member) {
    log("onMemberAdded: $channelName user: $member");
  }

  void onMemberRemoved(String channelName, PusherMember member) {
    log("onMemberRemoved: $channelName user: $member");
  }

  void onSubscriptionCount(String channelName, int subscriptionCount) {
    log("onSubscriptionCount: $channelName subscriptionCount: $subscriptionCount");
  }

  dynamic onAuthorizer(
      String channelName, String socketId, dynamic options) async {
    DataBase dataBase = DataBase();

    log(channelName.toString());
    log(socketId.toString());
    final response = await http
        .post(Uri.parse("https://jumpersksa.com/api/pusher-auth"), body: {
      'socket_id': socketId,
      'channel_name': channelName,
    }, headers: {
      "Authorization": "Bearer ${dataBase.restoreUserModel().apiToken}"
    });

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      log(response.body.toString());
      throw Exception('Failed to authenticate private channel');
    }
  }

  bool isChatOpen = false;
  TextEditingController? messageController;
  DataState<List<Messages>> dataState = const DataInitial<List<Messages>>();
  final chatController = Get.put(ChatsController());

  DataState get status => dataState;
  final Chat chat;
  final String chatType;

  FetchMessagesController({
    required this.chat,
    required this.chatType,
  });

  //<editor-fold desc="EmojiPackage">

  /// *************************** EmojiPackage ************************

  bool _emojiShowing = false;

  bool get emojiShowing => _emojiShowing;

  onEmojiSelected(Emoji emoji) {
    messageController!
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: messageController!.text.length));
  }

  onBackspacePressed() {
    messageController!
      ..text = messageController!.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: messageController!.text.length,
        ),
      );
  }

  toggleEmoji() {
    _emojiShowing = !_emojiShowing;
    update();
  }

  //</editor-fold>
  //<editor-fold desc="Scroll Controller">
  /// ******************************* Scroll Controller ************************

  ScrollController scrollController = ScrollController();
  bool _needsScroll = false;

  bool get needsScroll => _needsScroll;

  void scrollToBottom() {
    printDM("SCROLLLLLLLL");
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
      printDM("SCROLLLLLLLL");
    });
    _needsScroll = false;
    update();
  }

  //</editor-fold>
  //<editor-fold desc="Fetch Firebase">
  /// ******************************* Firebase *********************************
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // final List<Messages> _messages = [];

  // List<Messages> get messages => _messages;
  // void loadMessagesFromFirebase() {
  //   List<Messages> _fireMessages = [];
  //   _dataState = const DataLoading();
  //   update();
  //   final query = _firestore
  //       .collection(kChatsCollection)
  //       .doc("${chat.chatId}")
  //       .collection(kMessagesCollection)
  //       .orderBy(kOrderByDate);
  //
  //   try {
  //     query.snapshots().listen((event) {
  //       _fireMessages = [];
  //       for (var doc in event.docs) {
  //         final message = Messages.fromJson(doc.data(), messageId: doc.id);
  //         _fireMessages.add(message);
  //         // bool isContained = _messages
  //         //     .map((e) => e.messageId)
  //         //     .toList()
  //         //     .toList()
  //         //     .contains(message.messageId);
  //         // if (!isContained) {
  //         //   _messages.insert(0, message);
  //         // }
  //
  //         // // _messages.add(message);
  //         // printDM("MESSAGE  ID ${doc.id} LOADED");
  //         // printDM("MESSAGES  11 ${_status.data} LOADED");
  //
  //         // if(_status.data.map((e)=>e.messageId).toList().contains(message.messageId)){
  //         //   _status.data.insert(0, message);
  //         // }
  //       }
  //       _messages = [];
  //       _messages.addAll(_apiMessages);
  //       _messages.addAll(_fireMessages);
  //
  //       // chatController.addMessagesLocal(
  //       //   chatId: chat.chatId!,
  //       //   messages: _messages,
  //       //   apiMessages: _apiMessages,
  //       //   lastMessage: _messages.isNotEmpty ? _messages.last : null,
  //       // );
  //       // for (int i = 0; i < _messages.length; i++) {
  //       //  if(_status.data.map((e)=>e.messageId).toList().contains(message.messageId)){
  //       //    _status.data.insert(i, _messages[i]);
  //       //  }
  //       // }
  //       _dataState = DataSuccess(_messages);
  //       chatController.clearMyMessageCount(chat: chat);
  //
  //       update();
  //     });
  //     printDM("MESSAGES  22 $_messages LOADED");
  //   } catch (e) {
  //     _dataState = DataFailed(
  //         ErrorModel(errorTitle: e.toString(), errorType: ErrorType.unKnown));
  //     update();
  //   }
  // }

  // final user = DataBase().restoreUserModel();

  // Messages _chatToMessageConverter(Chat chat, String message) {
  //   printDM("User =>$user");
  //   return Messages(
  //     message: message,
  //     chatId: chat.chatId,
  //     userId: user.id,
  //     seenStatus: SeenStatus.delivered,
  //     userImage: user.image,
  //     userName: user.name,
  //     date: "",
  //     messageId: null,
  //   );
  // }

  // final SendNotificationService _sendNotificationService =
  //     Get.put(SendNotificationService());

  // void addMessageToFirebase() {
  //   final messageId = _firestore
  //       .collection(kChatsCollection)
  //       .doc("${chat.chatId}")
  //       .collection(kMessagesCollection)
  //       .doc()
  //       .id;
  //   if (messageController!.text.isNotEmpty) {
  //     // final message = _chatToMessageConverter(chat, messageController!.text)
  //     //     .copyWith(messageId: messageId);
  //     _firestore
  //         .collection(kChatsCollection)
  //         .doc("${chat.chatId}")
  //         .collection(kMessagesCollection)
  //         .doc(messageId)
  //         .set(message.toJson());
  //     String notificationMessage = '';
  //     notificationMessage = messageController!.text;
  //     messageController!.text = "";
  //     chat.increaseMessageCount();
  //     final updatedChat = chat.copyWith(
  //       lastMessage: message,
  //       date: DateTime.now(),
  //     );
  //     _firestore.collection(kChatsCollection).doc("${chat.chatId}").set(
  //           updatedChat.toJson(),
  //         );
  //     chat.sendNotification(message: notificationMessage);
  //     printDM("message is >> $message");
  //     printDM("Updated Chat is >> $updatedChat");
  //   }
  //
  //   // scrollController.scrollTo(index: 150, duration: Duration(seconds: 1));
  //   // .add(message.toJson());
  // }

  /// **************************************************************************

  //</editor-fold>
  //<editor-fold desc="API">

  /// ******************************* API CALL *********************************
  final FetchMessagesRepository _fetchMessagesRepository =
      FetchMessagesRepository();
  final SendMessagesRepository _sendMessagesRepository =
      SendMessagesRepository();

  List<Messages> _apiUserMessages = [];
  List<Messages> _apiGroupMessages = [];
  // ignore: prefer_final_fields
  DataState<List<Messages>> _status = const DataLoading();

  Future<void> loadMessagesFromApi(String chatType) async {
    print('welocome from api');
    dataState = const DataLoading();

    update();
    dataState = await _fetchMessagesRepository.fetchMessages(
      ChatMessagesParams(
        chatId: int.parse(chat.chatId!),
        chatType: chatType == 'user' ? 'user' : 'group',
      ),
    )!;

    printDM("DATA FROM API ${dataState.data?.length.toString()}");
    // printDM("DATA FROM API ${dataState.data!.map((e) => e.toJson()).toString()}");
    update();
    // _dataState = const DataSuccess([]);
    if (chatType == 'user') {
      if (dataState is DataSuccess) {
        if (dataState.data != null) {
          print('a7teeeeen tlata ${dataState.data}');
          _apiUserMessages = dataState.data!.isNotEmpty ? dataState.data! : [];
          _apiUserMessages.addAll(dataState.data!);
          printDM("DATA FROM API $_apiUserMessages");
          printDM("HUNTER FROM API ${dataState.data!.length}");
          update();
          // loadMessagesFromFirebase();
        } else {
          _apiUserMessages = [];
        }
      }
    } else {
      if (dataState is DataSuccess) {
        if (dataState.data != null) {
          print('a7teeeeen tlata ${dataState.data}');
          _apiGroupMessages = dataState.data!.isNotEmpty ? dataState.data! : [];
          _apiGroupMessages.addAll(dataState.data!);
          printDM("DATA FROM API $_apiGroupMessages");
          printDM("HUNTER FROM API ${dataState.data!.length}");
          update();
          // loadMessagesFromFirebase();
        } else {
          _apiGroupMessages = [];
        }
      }
    }
  }

  Future<void> sendMessagesToApi(SendChatMessagesParams params) async {
    update();
    await _sendMessagesRepository.sendMessages(params)!;

    printDM("DATA FROM API ${dataState.data?.length.toString()}");
    update();
    // _dataState = const DataSuccess([]);
  }

  /// **************************************************************************
  //</editor-fold>
  void _checkChat() {
    if (chatType == ChatType.user.value) {
      if (chat.isOpened ?? false) {
        // loadMessagesFromFirebase();
      } else {
        loadMessagesFromApi('user');
      }
    } else {
      if (chat.isOpened ?? false) {
        // loadMessagesFromFirebase();
      } else {
        loadMessagesFromApi('group');
      }
    }
  }

  @override
  void onInit() {
    onConnectPressed();
    isChatOpen = true;
    _checkChat();
    printDM("OPPPPPPEN");
    //_scrollToBottom();
    // loadMessagesFromApi();
    // loadMessagesFromFirebase();
    messageController = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    isChatOpen = false;
    messageController?.dispose();
    scrollController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
