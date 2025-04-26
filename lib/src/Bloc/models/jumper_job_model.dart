import 'package:jumper/src/Bloc/models/title_model.dart';
import 'package:jumper/src/Core/utils/utils.dart';

class JumperJobModel {
  late List<JumperJob> myJobs = [];
  late List<JumperJob> jobs = [];
  late bool offersStatus;

  JumperJobModel({
    required this.myJobs,
    required this.jobs,
    required this.offersStatus,
  });

  @override
  String toString() {
    return 'JumperJobModel{myJobs: $myJobs, jobs: $jobs, offersStatus: $offersStatus}';
  }

  JumperJobModel.fromMap(Map<String, dynamic> json) {
    myJobs = json['my_jobs'] != null
        ? List.from(json['my_jobs']).map((e) => JumperJob.fromMap(e)).toList()
        : [];
    printDM("123333333333333 my jobs => $myJobs");
    jobs = json['jobs'] != null
        ? List.from(json['jobs']).map((e) => JumperJob.fromMap(e)).toList()
        : [];
    printDM("123333333333333  jobs => $jobs");

    offersStatus = (json["offers_status"] != null
        ? (json["offers_status"] == 1 ? true : false)
        : false);
    printDM("123333333333333  offersStatus => $offersStatus");
  }
}

class JumperJob {
  late int status;
  late int id;
  late int serviceId;
  late String serviceTitle;
  late int nationalityId;
  late String nationalityTitle;
  late String workTypeTitle;
  late int timeTypeId;
  late String timeTypeTitle;
  late int salary;
  late String description;
  late String city;
  late int distance;
  late String companyAddress;
  late dynamic companyLat;
  late dynamic companyLon;
  late String fullAddress;
  late String startDate;
  late String endDate;
  late String startTime24;
  late String startTimeFormat;
  late String endTime24;
  late String endTimeFormat;
  late List<TitleModel> skills;
  late List<TitleModel> languages;
  late int isDays;

  /// added
  late List<String> days;
  late int numberOfDays;
  late String publishedAt;
  late int hoursToAccept;

  // late int totalWorkDays;
  late String publishedAtDifference;
  late String companyName;
  late String companyPhone;
  late String companyImage;
  late int companyID;
  late String deviceToken;

  late int groupId;

  JumperJob({
    required this.status,
    required this.id,
    required this.serviceId,
    required this.serviceTitle,
    required this.nationalityId,
    required this.nationalityTitle,
    required this.workTypeTitle,
    required this.timeTypeId,
    required this.timeTypeTitle,
    required this.salary,
    required this.city,
    required this.distance,
    required this.description,
    required this.companyAddress,
    required this.companyLat,
    required this.companyLon,
    required this.fullAddress,
    required this.startDate,
    required this.endDate,
    required this.startTime24,
    required this.startTimeFormat,
    required this.endTime24,
    required this.endTimeFormat,
    required this.skills,
    required this.languages,
    required this.isDays,
    required this.days,
    required this.numberOfDays,
    required this.publishedAt,
    required this.hoursToAccept,
    // required this.totalWorkDays,
    required this.publishedAtDifference,
    required this.companyName,
    required this.companyPhone,
    required this.companyImage,
    required this.companyID,
    required this.deviceToken,
    required this.groupId,
  });

  @override
  String toString() {
    return 'JumperJobModel{ status: $status, id: $id, serviceId: $serviceId, serviceTitle: $serviceTitle, nationalityId: $nationalityId, nationalityTitle: $nationalityTitle, workTypeTitle: $workTypeTitle, timeTypeId: $timeTypeId, timeTypeTitle: $timeTypeTitle, salary: $salary, city: $city, description: $description, distance: $distance, companyAddress: $companyAddress, companyLat: $companyLat, companyLon: $companyLon, fullAddress: $fullAddress, startDate: $startDate, endDate: $endDate, startTime24: $startTime24, startTimeFormat: $startTimeFormat, endTime24: $endTime24, endTimeFormat: $endTimeFormat, skills: $skills, languages: $languages, isDays: $isDays, days: $days, numberOfDays: $numberOfDays, publishedAt: $publishedAt, hoursToAccept: $hoursToAccept, publishedAtDifference: $publishedAtDifference, companyName: $companyName, companyPhone: $companyPhone, companyImage: $companyImage, device_token: $deviceToken, companyID: $companyID,}';
  }

  JumperJob.fromMap(Map<String, dynamic> map) {
    printDM("****************** JumperJob ******************");
    status = map['status'] ?? 0;
    printDM("JumperJob Status =>$status");
    id = map['id'] ?? 0;
    printDM("JumperJob id =>$id");
    serviceId = map['service_id'] ?? 0;
    printDM("JumperJob serviceId =>$serviceId");
    serviceTitle = map['service_title'] ?? "";
    printDM("JumperJob serviceTitle =>$serviceTitle");
    nationalityId = map['nationality_id'] ?? 0;
    printDM("JumperJob nationalityId =>$nationalityId");
    nationalityTitle = map['nationality_title'] ?? "";
    printDM("JumperJob nationalityTitle =>$nationalityTitle");

    workTypeTitle = map['work_type_title'] ?? "";
    printDM("JumperJob workTypeTitle =>$workTypeTitle");

    timeTypeId = map['time_type_id'] ?? 0;
    printDM("JumperJob timeTypeId =>$timeTypeId");

    timeTypeTitle = map['time_type_title'] ?? "";
    printDM("JumperJob timeTypeTitle =>$timeTypeTitle");
    salary = map['price'] ?? 0;
    printDM("JumperJob salary =>$salary");
    city = map['city'] ?? 0;
    printDM("JumperJob city =>$city");
    description = map['description'] ?? "";
    printDM("JumperJob description =>$description");
    distance = map['distance'] ?? "";
    printDM("JumperJob distance =>$distance");
    companyAddress = map['company_address'] ?? "";
    printDM("JumperJob companyAddress =>$companyAddress");
    companyLat = map['company_lat'] ?? 0.0;
    printDM("JumperJob companyLat =>$companyLat");
    companyLon = map['company_lon'] ?? 0.0;
    printDM("JumperJob companyLon =>$companyLon");

    fullAddress = map['full_address'] ?? "";
    printDM("JumperJob fullAddress =>$fullAddress");
    startDate = map['start_date'] ?? '';
    printDM("JumperJob startDate =>$startDate");
    endDate = map['end_date'] ?? '';
    printDM("JumperJob endDate =>$endDate");
    startTime24 = map['start_time'] ?? '';
    printDM("JumperJob startTime24 =>$startTime24");
    startTimeFormat = map['start_time_format'] ?? '';
    printDM("JumperJob startTimeFormat =>$startTimeFormat");
    endTime24 = map['end_time'] ?? '';
    printDM("JumperJob endTime24 =>$endTime24");
    endTimeFormat = map['end_time_format'] ?? '';
    printDM("JumperJob endTimeFormat =>$endTimeFormat");
    skills = map['skills'] != null
        ? List.from(map['skills']).map((e) => TitleModel.fromJson(e)).toList()
        : [];
    printDM("JumperJob skills =>$skills");
    languages = map['languages'] != null
        ? List.from(map['languages'])
            .map((e) => TitleModel.fromJson(e))
            .toList()
        : [];
    printDM("JumperJob languages =>$languages");
    isDays = map['is_days'] ?? 0;
    printDM("JumperJob isDays =>$isDays");
    days = List<String>.from(map["days"].map((x) => x));
    printDM("JumperJob days =>$days");
    numberOfDays = map['number_of_days'] ?? 0;
    printDM("JumperJob numberOfDays =>$numberOfDays");
    publishedAt = map['published_at'] ?? "";
    printDM("JumperJob publishedAt =>$publishedAt");
    hoursToAccept = map['hours_to_accept'] ?? 0;
    printDM("JumperJob hoursToAccept =>$hoursToAccept");
    // totalWorkDays = map['total_work_days'] ?? 0;
    publishedAtDifference = map['published_at_diff'] ?? "";
    printDM("JumperJob publishedAtDifference =>$publishedAtDifference");
    companyName = map['company_name'] ?? "";
    printDM("JumperJob companyName =>$companyName");
    companyPhone = map['company_phone'] ?? "";
    printDM("JumperJob companyPhone =>$companyPhone");
    companyImage = map['company_image'] ?? "";
    printDM("JumperJob companyImage =>$companyImage");
    companyID = map['company_id'] ?? 0;
    printDM("JumperJob companyID =>$companyID");
    deviceToken = map["device_token"] ?? '';
    printDM("Sherbini deviceToken $deviceToken");
    groupId = map["group_id"] ?? 0;
    printDM(" ++++ job group_id $groupId ++++");
    printDM("***********************************************");
  }
}
