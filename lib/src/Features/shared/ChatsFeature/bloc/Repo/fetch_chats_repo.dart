import 'dart:io';

import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/shared/ChatsFeature/bloc/Service/fetch_chats_service.dart';
import 'package:jumper/src/Features/shared/ChatsFeature/bloc/model/chat.dart';

class FetchChatsRepository {
  final FetchChatsService _fetchChatsService = Get.put(FetchChatsService());

  Future<DataState<List<Chat>>>? fetchChats() async {
    try {
      final httpResponse = await _fetchChatsService.fetchChats();
      if (((httpResponse.statusCode == HttpStatus.ok) ||
              (httpResponse.statusCode == HttpStatus.created) ||
              (httpResponse.statusCode == HttpStatus.accepted)) &&
          (httpResponse.data['status'] ?? false)) {
        if (httpResponse.data['data'] != null) {
          printDM(" FetchChatsRepository is ${httpResponse.data['data']}");

          List<Chat> chats = [];
          for (var item in httpResponse.data['data']) {
            chats.add(Chat.fromJson(item));
          }
          printDM("chats ${chats.length}");
          return DataSuccess<List<Chat>>(chats);
        } else {
          return DataFailed(ErrorModel(
              errorTitle: httpResponse.data['message'] ?? '',
              errorType: ErrorType.dataEmpty));
        }
      }
      return DataFailed(ErrorModel(
          errorTitle: httpResponse.data['message'] ?? '',
          errorType: ErrorType.unKnown));
    } on NetworkDisconnectException {
      return DataFailed(ErrorModel(
          errorTitle: networkDisconnectException,
          errorType: ErrorType.networkConnection));
    } on ServerSideException {
      return DataFailed(ErrorModel(
          errorTitle: serverSideException, errorType: ErrorType.serverSide));
    } on UnKnownException {
      return DataFailed(ErrorModel(
          errorTitle: unKnownException, errorType: ErrorType.unKnown));
    } catch (e) {
      return DataFailed(
          ErrorModel(errorTitle: '$e', errorType: ErrorType.unKnown));
    }
  }
}
