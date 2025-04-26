class GroupMessgeResponse {
  List<Messages>? messages;
  String? groupId;

  GroupMessgeResponse({this.messages, this.groupId});

  GroupMessgeResponse.fromJson(Map<String, dynamic> json) {
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
  Null? attachment;
  String? seen;
  String? createdAt;
  User? user;

  Messages(
      {this.id,
      this.groupId,
      this.userId,
      this.body,
      this.attachment,
      this.seen,
      this.createdAt,
      this.user});

  Messages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupId = json['group_id'];
    userId = json['user_id'];
    body = json['body'];
    attachment = json['attachment'];
    seen = json['seen'];
    createdAt = json['created_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
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
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? image;

  User({this.id, this.name, this.image});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
