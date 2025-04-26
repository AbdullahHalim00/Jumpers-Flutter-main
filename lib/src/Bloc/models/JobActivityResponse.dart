class JobActivityResponse {
  int? status;
  String? message;
  List<Data>? data;

  JobActivityResponse({this.status, this.message, this.data});

  JobActivityResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? date;
  List<Activity>? activity;

  Data({this.date, this.activity});

  Data.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['activity'] != null) {
      activity = <Activity>[];
      json['activity'].forEach((v) {
        activity!.add(new Activity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.activity != null) {
      data['activity'] = this.activity!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Activity {
  String? company;
  String? time;
  String? date;
  String? type;

  Activity({this.company, this.time, this.date, this.type});

  Activity.fromJson(Map<String, dynamic> json) {
    company = json['company'];
    time = json['time'];
    date = json['date'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company'] = this.company;
    data['time'] = this.time;
    data['date'] = this.date;
    data['type'] = this.type;
    return data;
  }
}
