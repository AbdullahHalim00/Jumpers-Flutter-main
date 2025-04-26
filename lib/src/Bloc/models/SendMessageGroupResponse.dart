class SendMessageGroupResponse {
  List<Messages>? messages;
  String? groupId;

  SendMessageGroupResponse({this.messages, this.groupId});

  SendMessageGroupResponse.fromJson(Map<String, dynamic> json) {
    if (json['messages'] != null) {
      messages = <Messages>[];
      json['messages'].forEach((v) {
        messages!.add(new Messages.fromJson(v));
      });
    }
    groupId = json['group_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.messages != null) {
      data['messages'] = this.messages!.map((v) => v.toJson()).toList();
    }
    data['group_id'] = this.groupId;
    return data;
  }
}

class Messages {
  int? id;
  String? groupId;
  String? userId;
  String? body;
  String? attachment;
  String? seen;
  String? createdAt;
  String? updatedAt;

  Messages({
    this.id,
    this.groupId,
    this.userId,
    this.body,
    this.attachment,
    this.seen,
    this.createdAt,
    this.updatedAt,
  });

  Messages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupId = json['group_id'];
    userId = json['user_id'];
    body = json['body'];
    attachment = json['attachment'];
    seen = json['seen'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['group_id'] = this.groupId;
    data['user_id'] = this.userId;
    data['body'] = this.body;
    data['attachment'] = this.attachment;
    data['seen'] = this.seen;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;

    return data;
  }
}
