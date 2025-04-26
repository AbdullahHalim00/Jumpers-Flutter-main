class EmployeeActivityResponse {
  int? status;
  String? msg;
  Data? data;

  EmployeeActivityResponse({this.status, this.msg, this.data});

  EmployeeActivityResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? jobNumberOfDays;
  int? attendanceDays;
  int? depDays;
  List<AttendanceHistory>? attendanceHistory;

  Data(
      {this.jobNumberOfDays,
      this.attendanceDays,
      this.depDays,
      this.attendanceHistory});

  Data.fromJson(Map<String, dynamic> json) {
    jobNumberOfDays = json['job_number_of_days'];
    attendanceDays = json['attendance_days'];
    depDays = json['dep_days'];
    if (json['attendance_history'] != null) {
      attendanceHistory = <AttendanceHistory>[];
      json['attendance_history'].forEach((v) {
        attendanceHistory!.add(new AttendanceHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['job_number_of_days'] = this.jobNumberOfDays;
    data['attendance_days'] = this.attendanceDays;
    data['dep_days'] = this.depDays;
    if (this.attendanceHistory != null) {
      data['attendance_history'] =
          this.attendanceHistory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AttendanceHistory {
  String? date;
  List<Attendance>? attendance;

  AttendanceHistory({this.date, this.attendance});

  AttendanceHistory.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['attendance'] != null) {
      attendance = <Attendance>[];
      json['attendance'].forEach((v) {
        attendance!.add(new Attendance.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.attendance != null) {
      data['attendance'] = this.attendance!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attendance {
  String? lat;
  String? lng;
  String? createdAt;
  String? isAttendees;

  Attendance({this.lat, this.lng, this.createdAt, this.isAttendees});

  Attendance.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
    createdAt = json['created_at'];
    isAttendees = json['is_attendees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['created_at'] = this.createdAt;
    data['is_attendees'] = this.isAttendees;
    return data;
  }
}
