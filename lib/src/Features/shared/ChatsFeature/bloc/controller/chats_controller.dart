//<editor-fold desc="Imports">
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jumper/src/Bloc/models/ContactResponse.dart';
import 'package:jumper/src/Bloc/models/GroupContactResponse.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/FCM/fcm_service.dart';
import 'package:jumper/src/Core/utils/storage_util.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/shared/ChatDetailsFeature/ui/screens/imports_chat_details.dart';
import 'package:jumper/src/Features/shared/ChatsFeature/bloc/model/chat.dart';
import 'package:jumper/src/Features/shared/ChatsFeature/bloc/model/message_model.dart';

import '../../../../../Core/services/FirebaseChat/firestore_service.dart';
//</editor-fold>

class ChatsController extends GetxController {
  final DataState<List<Chat>> _status = const DataInitial<List<Chat>>();

  DataState get status => _status;

  final DataBase _dataBase = Get.put(
    DataBase(),
  );

  //<editor-fold desc="Chat">
  ///******* Firebase ********\\\

  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<Chat> _chats = [];

  List<Chat> get chats => _chats;
  final List<Chat> _groupChats = [];

  List<Chat> get groupChats => _groupChats;

  ContactResponse? contactResponse;
  GroupContactResponse? groupContactResponse;

  getContactUser() async {
    Dio dioNew = Dio();
    dioNew.options.headers = {
      "Authorization": "Bearer ${_dataBase.restoreUserModel().apiToken}"
    };
    try {
      var response = await dioNew.get(
        'https://jumpersksa.com/api/get-contacts-users',
      );
      log("this is getContactUser data ${response.data}");

      contactResponse = ContactResponse.fromJson(response.data);
      if (contactResponse!.status.toString() == "200") {
        for (var c in contactResponse!.contacts!) {
          _chats.add(
            Chat(
              id: c.id,
              jobEnded: c.jobEnded,
              messageCount: 0,
              messages: [
                MessageModel(
                  userId: 1,
                  userImage: "",
                ),
              ],
              image: '${c.image}',
              name: '${c.name}',
              lastMessage: MessageModel(message: ''),
              chatType: ChatType.user,
              chatId: "${c.id}",
              date: DateFormat("yyyy-MM-dd hh:mm:ss")
                  .parse(c.maxCreatedAt.toString()),
              sharedProperties: [
                SharedProperties(
                  messageCount: 1,
                  token: "",
                  id: 1,
                ),
              ],
            ),
          );
        }
      } else {}
    } on Exception catch (e) {
      log(e.toString());
    }

    update();
  }

  getGroupContactUser() async {
    Dio dioNew = Dio();
    dioNew.options.headers = {
      "Authorization": "Bearer ${_dataBase.restoreUserModel().apiToken}"
    };

    try {
      var response = await dioNew.get(
        'https://jumpersksa.com/api/get-groups-users',
      );
      log("this is getGroupContactUser data ${response.data}");

      groupContactResponse = GroupContactResponse.fromJson(response.data);
      //ToDo groupsMessageFlag
      log("this is group messages$groupContactResponse");
      if (groupContactResponse!.status.toString() == "200") {
        for (var c in groupContactResponse!.data!) {
          _groupChats.add(
            Chat(
              id: c.groupId,
              jobEnded: c.jobEnded ?? false,
              messageCount: 0,
              messages: [
                MessageModel(
                  userId: 1,
                  userImage: "",
                ),
              ],
              image: '${c.companyImage}',
              name: '${c.companyName}',
              lastMessage: MessageModel(message: ''),
              chatType: ChatType.group,
              chatId: "${c.groupId}",
              date: DateTime.now(),
              sharedProperties: [
                SharedProperties(
                  messageCount: 1,
                  token: "",
                  id: 1,
                ),
              ],
            ),
          );
        }
        log("this is messages data $_groupChats");
      } else {
        Utils.showToast(
          title: "error from loading groups messages",
          state: UtilState.Error,
        );
      }
    } on Exception catch (e) {
      log("this error from getGroupContactUser $e");
    }

    update();
  }

  final user = DataBase().restoreUserModel();

  bool jobEnded(int targetID){
    final chats = _groupChats.where(
      (element) => element.id == targetID,
    );
    return chats.isEmpty
      ? true
      : chats.first.jobEnded;
  }

  void startChat({
    required String? targetName,
    required int targetID,
    required String? targetImage,
    required String? targetToken,
    required String chatType,
  }) {
    if (chatType == "group") {
      Chat existingChat = _groupChats.firstWhere(
        (element) => element.id == targetID,
      );

      Get.to(
        () => MessagesScreen(
          chat: existingChat,
          chatType: chatType,
        ),
      );
      printDM("chat exists");
    } else {
      Chat? existingChat = _chats.firstWhereOrNull(
        (element) => element.id == targetID && element.name == targetName,
      );

      if (existingChat != null) {
        Get.to(
          () => MessagesScreen(
            chat: existingChat,
            chatType: chatType,
          ),
        );
        printDM("chat exists");
      } else {
        //* open new Messages
        Get.to(
          () => MessagesScreen(
            chat: Chat(
              id: targetID,
              name: targetName,
              image: targetImage,
              jobEnded: false,
              messages: [],
            ),
            chatType: chatType,
          ),
        );
      }
    }
  }

  //</editor-fold>
  //<editor-fold desc="Navigate">
  void clearMyMessageCount({required Chat chat}) {
    final index = _chats.indexWhere((e) => e.chatId == chat.chatId);
    if (index != -1) {
      _chats[index].clearMyMessageCount();
      FirestoreService.updateChatProperties(
        chatId: chat.chatId.toString(),
        sharedProperties: _chats[index].sharedProperties!,
      );
      // FCMService().
    }
    update();
    // Get.to(() => MessagesScreen(chat: chat));
  }

  //</editor-fold>

  @override
  void onInit() {
    getContactUser();
    getGroupContactUser();
    // loadChatsViaFirebase();

    // firebaseChatsListener();
    super.onInit();
  }
}
