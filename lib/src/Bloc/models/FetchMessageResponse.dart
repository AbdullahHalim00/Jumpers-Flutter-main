class FetchMessageResponse {
  int? total;
  int? lastPage;
  int? lastMessageId;
  List<Messages>? messages;
  String? jobId;

  FetchMessageResponse(
      {this.total,
      this.lastPage,
      this.lastMessageId,
      this.messages,
      this.jobId});

  FetchMessageResponse.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    lastPage = json['last_page'];
    lastMessageId = json['last_message_id'];
    if (json['messages'] != null) {
      messages = <Messages>[];
      json['messages'].forEach((v) {
        messages!.add(Messages.fromJson(v));
      });
    }
    jobId = json['job_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['last_page'] = lastPage;
    data['last_message_id'] = lastMessageId;
    if (messages != null) {
      data['messages'] = messages!.map((v) => v.toJson()).toList();
    }
    data['job_id'] = jobId;
    return data;
  }
}

class Messages {
  int? index;
  int? id;
  String? fromId;
  String? toId;
  String? message;
  List<String>? attachment;
  String? time;
  String? seen;

  Messages({
    this.index,
    this.id,
    this.fromId,
    this.toId,
    this.message,
    this.attachment,
    this.time,
    this.seen,
  });

  Messages.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    id = json['id'];
    fromId = json['from_id'];
    toId = json['to_id'];
    message = json['message'];
    attachment = json['attachment'].cast<String>();
    time = json['time'];
    seen = json['seen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['index'] = index;
    data['id'] = id;
    data['from_id'] = fromId;
    data['to_id'] = toId;
    data['message'] = message;
    data['attachment'] = attachment;
    data['time'] = time;
    data['seen'] = seen;
    return data;
  }
}
