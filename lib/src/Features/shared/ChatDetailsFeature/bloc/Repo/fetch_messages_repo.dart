import 'dart:io';

import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/shared/ChatDetailsFeature/bloc/Parameters/fetch_messages_params.dart';
import 'package:jumper/src/Features/shared/ChatDetailsFeature/bloc/Service/fetch_messages_service.dart';

import '../../../../../Bloc/models/FetchMessageResponse.dart';
import '../Parameters/send_message_parameters.dart';

class FetchMessagesRepository {
  final FetchMessagesService _fetchMessagesService =
      Get.put(FetchMessagesService());

  Future<DataState<List<Messages>>>? fetchMessages(
      ChatMessagesParams params) async {
    try {
      final httpResponse = await _fetchMessagesService.fetchMessages(params);
      if (((httpResponse.statusCode == HttpStatus.ok) ||
          (httpResponse.statusCode == HttpStatus.created) ||
          (httpResponse.statusCode == HttpStatus.accepted))) {
        if (httpResponse.data['messages'] != null) {
          printDM(
              " FetchMessagesRepository is ${httpResponse.data['messages']}");
          printDM("HHHHHHHHHHHH");

          List<Messages> messages = [];
          for (var item in httpResponse.data['messages']) {
            messages.add(Messages.fromJson(item));
          }
          printDM("messages ${messages.length}");
          return DataSuccess<List<Messages>>(messages);
        } else {
          return DataFailed(
            ErrorModel(
              errorTitle: httpResponse.data['message'] ?? '',
              errorType: ErrorType.dataEmpty,
            ),
          );
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

class SendMessagesRepository {
  final SendMessagesService _sendMessagesService =
      Get.put(SendMessagesService());

  Future<void>? sendMessages(SendChatMessagesParams params) async {
    try {
      final httpResponse = await _sendMessagesService.sendMessages(params);
      if (((httpResponse.statusCode == HttpStatus.ok) ||
          (httpResponse.statusCode == HttpStatus.created) ||
          (httpResponse.statusCode == HttpStatus.accepted))) {
        printDM(" send Messages done");
        // if (httpResponse.data['messages'] != null) {
        //   printDM(
        //       " FetchMessagesRepository is ${httpResponse.data['messages']}");
        //   printDM("HHHHHHHHHHHH");

        //   List<Messages> messages = [];
        //   for (var item in httpResponse.data['messages']) {
        //     messages.add(Messages.fromJson(item));
        //   }
        //   printDM("messages ${messages.length}");
        //   return DataSuccess<List<Messages>>(messages);
        // } else {
        //   return DataFailed(ErrorModel(
        //       errorTitle: httpResponse.data['message'] ?? '',
        //       errorType: ErrorType.dataEmpty));
        // }
      }
    } catch (e) {
      printDM("error from send Messages $e");
    }
  }
}
