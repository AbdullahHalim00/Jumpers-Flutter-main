// ignore: file_names
class GroupContactResponse {
  int? status;
  List<Data>? data;

  GroupContactResponse({this.status, this.data});

  GroupContactResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  toString() => {
        "status": status,
        "data": data,
      }.toString();
}

class Data {
  int? jobId;
  bool? jobEnded;
  String? jobName;
  String? companyName;
  String? companyImage;
  String? toId;
  int? groupId;

  Data(
      {this.jobId,
      this.jobEnded,
      this.jobName,
      this.companyName,
      this.companyImage,
      this.toId,
      this.groupId});

  Data.fromJson(Map<String, dynamic> json) {
    jobId = json['job_id'];
    jobEnded = json['job_ended'];
    jobName = json['job_name'];
    companyName = json['company_name'];
    companyImage = json['company_image'];
    toId = json['to_id'];
    groupId = json['group_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['job_id'] = jobId;
    data['job_ended'] = jobEnded;
    data['job_name'] = jobName;
    data['company_name'] = companyName;
    data['company_image'] = companyImage;
    data['to_id'] = toId;
    data['group_id'] = groupId;
    return data;
  }

  @override
  String toString() => {
        "jobId": jobId,
        "jobEnded": jobEnded,
        "jobName": jobName,
        "companyName": companyName,
        "companyImage": companyImage,
        "toId": toId,
        "groupId": groupId,
      }.toString();
}
