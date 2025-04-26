class JobDetailsResponse {
  bool? status;
  String? message;
  Data? data;

  JobDetailsResponse({this.status, this.message, this.data});

  JobDetailsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  int? countAttendees;
  int? countDeparture;
  int? isOnline;
  int? serviceId;
  String? serviceTitle;
  int? nationalityId;
  String? nationalityTitle;
  String? workTypeTitle;
  int? timeTypeId;
  String? timeTypeTitle;
  int? price;
  String? description;
  String? companyAddress;
  num? companyLat;
  num? companyLon;
  String? fullAddress;
  String? startDate;
  String? endDate;
  String? startTime;
  String? endTime;
  int? status;
  int? cancel;
  List<Skills>? skills;
  List<Skills>? languages;
  int? isDays;
  List<Skills>? days;
  int? numberOfDays;
  String? publishedAt;
  int? hoursToAccept;
  String? startTimeFormat;
  String? endTimeFormat;
  String? companyName;
  String? companyPhone;
  String? companyImage;
  int? companyId;
  String? publishedAtDiff;

  Data(
      {this.id,
      this.countAttendees,
      this.countDeparture,
      this.isOnline,
      this.serviceId,
      this.serviceTitle,
      this.nationalityId,
      this.nationalityTitle,
      this.workTypeTitle,
      this.timeTypeId,
      this.timeTypeTitle,
      this.price,
      this.description,
      this.companyAddress,
      this.companyLat,
      this.companyLon,
      this.fullAddress,
      this.startDate,
      this.endDate,
      this.startTime,
      this.endTime,
      this.status,
      this.cancel,
      this.skills,
      this.languages,
      this.isDays,
      this.days,
      this.numberOfDays,
      this.publishedAt,
      this.hoursToAccept,
      this.startTimeFormat,
      this.endTimeFormat,
      this.companyName,
      this.companyPhone,
      this.companyImage,
      this.companyId,
      this.publishedAtDiff});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countAttendees = json['count_attendees'];
    countDeparture = json['count_departure'];
    isOnline = json['is_online'];
    serviceId = json['service_id'];
    serviceTitle = json['service_title'];
    nationalityId = json['nationality_id'];
    nationalityTitle = json['nationality_title'];
    workTypeTitle = json['work_type_title'];
    timeTypeId = json['time_type_id'];
    timeTypeTitle = json['time_type_title'];
    price = json['price'];
    description = json['description'];
    companyAddress = json['company_address'];
    companyLat = json['company_lat'];
    companyLon = json['company_lon'];
    fullAddress = json['full_address'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    status = json['status'];
    cancel = json['cancel'];
    if (json['skills'] != null) {
      skills = <Skills>[];
      json['skills'].forEach((v) {
        skills!.add(new Skills.fromJson(v));
      });
    }
    if (json['languages'] != null) {
      languages = <Skills>[];
      json['languages'].forEach((v) {
        languages!.add(new Skills.fromJson(v));
      });
    }
    isDays = json['is_days'];
    if (json['days'] != null) {
      days = <Skills>[];
      json['days'].forEach((v) {
        days!.add(new Skills.fromJson(v));
      });
    }
    numberOfDays = json['number_of_days'];
    publishedAt = json['published_at'];
    hoursToAccept = json['hours_to_accept'];
    startTimeFormat = json['start_time_format'];
    endTimeFormat = json['end_time_format'];
    companyName = json['company_name'];
    companyPhone = json['company_phone'];
    companyImage = json['company_image'];
    companyId = json['company_id'];
    publishedAtDiff = json['published_at_diff'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['count_attendees'] = this.countAttendees;
    data['count_departure'] = this.countDeparture;
    data['is_online'] = this.isOnline;
    data['service_id'] = this.serviceId;
    data['service_title'] = this.serviceTitle;
    data['nationality_id'] = this.nationalityId;
    data['nationality_title'] = this.nationalityTitle;
    data['work_type_title'] = this.workTypeTitle;
    data['time_type_id'] = this.timeTypeId;
    data['time_type_title'] = this.timeTypeTitle;
    data['price'] = this.price;
    data['description'] = this.description;
    data['company_address'] = this.companyAddress;
    data['company_lat'] = this.companyLat;
    data['company_lon'] = this.companyLon;
    data['full_address'] = this.fullAddress;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['status'] = this.status;
    data['cancel'] = this.cancel;
    if (this.skills != null) {
      data['skills'] = this.skills!.map((v) => v.toJson()).toList();
    }
    if (this.languages != null) {
      data['languages'] = this.languages!.map((v) => v.toJson()).toList();
    }
    data['is_days'] = this.isDays;
    if (this.days != null) {
      data['days'] = this.days!.map((v) => v.toJson()).toList();
    }
    data['number_of_days'] = this.numberOfDays;
    data['published_at'] = this.publishedAt;
    data['hours_to_accept'] = this.hoursToAccept;
    data['start_time_format'] = this.startTimeFormat;
    data['end_time_format'] = this.endTimeFormat;
    data['company_name'] = this.companyName;
    data['company_phone'] = this.companyPhone;
    data['company_image'] = this.companyImage;
    data['company_id'] = this.companyId;
    data['published_at_diff'] = this.publishedAtDiff;
    return data;
  }
}

class Skills {
  int? id;
  String? title;

  Skills({this.id, this.title});

  Skills.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}
