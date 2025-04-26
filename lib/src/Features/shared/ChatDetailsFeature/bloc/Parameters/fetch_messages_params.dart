class ChatMessagesParams {
  final int? chatId;
  final String? chatType;

  ChatMessagesParams({
    required this.chatId,
    required this.chatType,
  });

  Map<String, dynamic> toJson() {
    return {
      if (chatId != null) 'id': chatId,
      if (chatType != null) 'type': chatType,
    };
  }
}
