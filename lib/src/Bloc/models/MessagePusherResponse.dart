class MessagePusherResponse {
  int? fromId;
  String? toId;
  String? message;
  int? isgroup;

  MessagePusherResponse({this.fromId, this.toId, this.message, this.isgroup});

  MessagePusherResponse.fromJson(Map<String, dynamic> json) {
    fromId = json['from_id'];
    toId = json['to_id'];
    message = json['message'];
    isgroup = json['isgroup'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from_id'] = this.fromId;
    data['to_id'] = this.toId;
    data['message'] = this.message;
    data['isgroup'] = this.isgroup;
    return data;
  }
}
