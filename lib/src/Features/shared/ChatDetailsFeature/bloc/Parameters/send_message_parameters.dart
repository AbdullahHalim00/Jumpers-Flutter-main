class SendChatMessagesParams {
  final String? type;
  final String? id;
  final String? message;

  SendChatMessagesParams({
    required this.type,
    required this.id,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      if (type != null) 'type': type,
      if (id != null) 'id': id,
      if (message != null) 'message': message,
    };
  }

  @override
  String toString() => {
        "type": type,
        "id": id,
        "message": message,
      }.toString();
}
