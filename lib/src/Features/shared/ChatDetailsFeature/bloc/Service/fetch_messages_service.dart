import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/services/network/api_names.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Core/services/network/network_services.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/shared/ChatDetailsFeature/bloc/Parameters/fetch_messages_params.dart';

import '../Parameters/send_message_parameters.dart';

class FetchMessagesService with ApiNames {
  final NetworkService _networkService = NetworkService();

  Future<Response> fetchMessages(ChatMessagesParams params) async {
    Response response;
    try {
      response = await _networkService.get(
        url: "$uRLFetchMessages?type=${params.chatType}&id=${params.chatId}",
        auth: true,
      );

      log("fetchMessages $response ");
    } on NetworkDisconnectException {
      throw NetworkDisconnectException(networkDisconnectException);
    } on ServerSideException {
      throw ServerSideException(serverSideException);
    } on UnKnownException {
      throw UnKnownException(unKnownException);
    } catch (e) {
      throw UnKnownException(e.toString());
    }
    return response;
  }
}

class SendMessagesService with ApiNames {
  final NetworkService _networkService = NetworkService();

  Future<Response> sendMessages(SendChatMessagesParams params) async {
    Response response;
    try {
      printDM("this is the sendMessage body $params");
      response = await _networkService.post(
        url: uRLSendMessage,
        auth: true,
        body: params.toJson(),
      );
      printDM("response from server $response");
    } on NetworkDisconnectException {
      throw NetworkDisconnectException(networkDisconnectException);
    } on ServerSideException {
      throw ServerSideException(serverSideException);
    } on UnKnownException {
      throw UnKnownException(unKnownException);
    } catch (e) {
      throw UnKnownException(e.toString());
    }
    return response;
  }
}
