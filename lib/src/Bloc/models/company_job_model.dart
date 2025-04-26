import 'package:jumper/src/Bloc/models/applicants_model.dart';
import 'package:jumper/src/Bloc/models/title_model.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Ui/cards/job_application_card.dart';

class CompanyJobModel {
  late ApplicationStatus status;
  late int id;
  late int serviceId;
  late String serviceTitle;
  late int nationalityId;
  late String nationalityTitle;
  late String workTypeTitle;
  late int timeTypeId;
  late String timeTypeTitle;
  late int workDurationId;
  late String workDurationTitle;
  late int jumperNumbers;
  late int ageFrom;
  late int ageTo;
  late int salary;
  late int gender;
  late String description;
  late String companyAddress;
  late dynamic companyLat;
  late dynamic companyLon;
  late String fullAddress;
  late String city;
  late String startDate;
  late String endDate;
  late String startTime24;
  late String startTimeFormat;
  late String endTime24;
  late String endTimeFormat;
  late List<TitleModel> skills;
  late List<TitleModel> languages;
  late List<ApplicantsModel> applicants;
  late int cancel;
  late int isDays;

  /// added
  late List<String> days;
  late String publishedAt;
  late int hoursToAccept;
  late int totalWorkDays;
  late dynamic accountTypeId;

  /// change later + lat + lon
  late String accountType;
  late String startDateFullFormat;
  late String endDateFullFormat;
  late String startTimeFullFormat;
  late String endTimeFullFormat;
  late String deviceToken;

  late int groupId;

//<editor-fold desc="Data Methods">

  CompanyJobModel({
    required this.id,
    required this.serviceId,
    required this.serviceTitle,
    required this.nationalityId,
    required this.nationalityTitle,
    required this.workTypeTitle,
    required this.timeTypeId,
    required this.timeTypeTitle,
    required this.workDurationId,
    required this.workDurationTitle,
    required this.jumperNumbers,
    required this.ageFrom,
    required this.ageTo,
    required this.salary,
    required this.gender,
    required this.description,
    required this.companyAddress,
    required this.companyLat,
    required this.companyLon,
    required this.fullAddress,
    required this.city,
    required this.startDate,
    required this.endDate,
    required this.startTime24,
    required this.startTimeFormat,
    required this.endTime24,
    required this.endTimeFormat,
    required this.skills,
    required this.languages,
    required this.status,
    required this.cancel,
    required this.isDays,
    required this.totalWorkDays,
    required this.days,
    required this.applicants,
    required this.publishedAt,
    required this.hoursToAccept,
    required this.accountType,
    required this.accountTypeId,
    required this.startDateFullFormat,
    required this.endDateFullFormat,
    required this.startTimeFullFormat,
    required this.endTimeFullFormat,
    required this.deviceToken,
    required this.groupId,
  });

  @override
  String toString() {
    return 'JobModel{ id: $id, serviceId: $serviceId, serviceTitle: $serviceTitle, nationalityId: $nationalityId, nationalityTitle: $nationalityTitle, workTypeTitle: $workTypeTitle, timeTypeId: $timeTypeId, timeTypeIdTitle: $timeTypeTitle, workDurationId: $workDurationId, workDurationTitle: $workDurationTitle, jumber_numbers: $jumperNumbers, ageFrom: $ageFrom, ageTo: $ageTo, price: $salary, gender: $gender, description: $description, companyAddress: $companyAddress, companyLat: $companyLat, companyLon: $companyLon, fullAddress: $fullAddress, city: $city, startDate: $startDate, endDate: $endDate, startTime: $startTime24, endTime: $endTime24, skills: $skills, languages: $languages, status: $status, cancel: $cancel, isDays: $isDays, numOfDays: $totalWorkDays, days: $days, publishedAt: $publishedAt, device_token: $deviceToken, applicants: $applicants,}';
  }

  CompanyJobModel.fromMap(Map<String, dynamic> map) {
    status = _intToStatus(map['status'] ?? 0);
    printDM("Sherbini status $status");
    id = map['id'] ?? 0;
    printDM("Sherbini id $id");
    serviceTitle = map['service_title'] ?? '';
    printDM("Sherbini serviceTitle $serviceTitle");
    serviceId = map['service_id'] ?? 0;
    printDM("Sherbini serviceId $serviceId");
    nationalityId = map['nationality_id'] ?? 0;
    printDM("Sherbini nationalityId $nationalityId");
    nationalityTitle = map['nationality_title'] ?? '';
    printDM("Sherbini nationalityTitle $nationalityTitle");
    workTypeTitle = map['work_type_title'] ?? '';
    printDM("Sherbini workTypeTitle $workTypeTitle");
    timeTypeId = map['time_type_id'] ?? 0;
    printDM("Sherbini timeTypeId $timeTypeId");
    timeTypeTitle = map['time_type_title'] ?? "";
    printDM("Sherbini timeTypeTitle $timeTypeTitle");
    workDurationId = map['work_duration_id'] ?? 0;
    printDM("Sherbini workDurationId $workDurationId");
    workDurationTitle = map['work_duration_title'] ?? '';
    printDM("Sherbini workDurationTitle $workDurationTitle");
    jumperNumbers = map['jumber_numbers'] ?? 0;
    printDM("Sherbini jumperNumbers $jumperNumbers");
    ageFrom = map['age_from'] ?? 0;
    printDM("Sherbini ageFrom $ageFrom");
    ageTo = map['age_to'] ?? 0;
    printDM("Sherbini ageTo $ageTo");
    salary = map['price'] ?? 0;
    printDM("Sherbini salary $salary");
    gender = map['gender'] ?? 0;
    printDM("Sherbini gender $gender");
    description = map['description'] ?? "";
    printDM("Sherbini description $description");
    companyAddress = map['company_address'] ?? "";
    printDM("Sherbini companyAddress $companyAddress");
    companyLat = map['company_lat'] ?? 0.0;
    printDM("Sherbini companyLat $companyLat");
    companyLon = map['company_lon'] ?? 0.0;
    printDM("Sherbini companyLon $companyLon");
    fullAddress = map['full_address'] ?? "";
    printDM("Sherbini fullAddress $fullAddress");
    city = map['city'] ?? "";
    printDM("Sherbini city $city");
    startDate = map['start_date'] ?? '';
    printDM("Sherbini startDate $startDate");
    endDate = map['end_date'] ?? '';
    printDM("Sherbini endDate $endDate");
    startTime24 = map['start_time'] ?? '';
    printDM("Sherbini startTime24 $startTime24");
    startTimeFormat = map['start_time_format'] ?? '';
    printDM("Sherbini startTimeFormat $startTimeFormat");
    endTime24 = map['end_time'] ?? '';
    printDM("Sherbini endTime24 $endTime24");
    endTimeFormat = map['end_time_format'] ?? '';
    printDM("Sherbini endTimeFormat $endTimeFormat");
    skills = map['skills'] != null
        ? List.from(map['skills']).map((e) => TitleModel.fromJson(e)).toList()
        : [];
    printDM("Sherbini skills $skills");
    languages = map['languages'] != null
        ? List.from(map['languages'])
            .map((e) => TitleModel.fromJson(e))
            .toList()
        : [];
    printDM("Sherbini languages $languages");
    cancel = map['cancel'] ?? 0;
    printDM("Sherbini cancel $cancel");
    isDays = map['is_days'] ?? 0;
    printDM("Sherbini isDays $isDays");
    totalWorkDays = map['number_of_days'] ?? 0;
    printDM("Sherbini totalWorkDays $totalWorkDays");
    publishedAt = map['published_at'] ?? "";
    printDM("Sherbini publishedAt $publishedAt");
    applicants = map['applicants'] != null
        ? List.from(map['applicants'])
            .map((e) => ApplicantsModel.fromMap(e))
            .toList()
        : [];
    printDM("Sherbini applicants $applicants");
    days = List<String>.from(map["days"].map((x) => x));
    printDM("Sherbini days $days");
    hoursToAccept = map["hours_to_accept"] ?? 0;
    printDM("Sherbini hoursToAccept $hoursToAccept");
    accountTypeId = map["account_type_id"] ?? 0;
    printDM("Sherbini accountTypeId $accountTypeId");
    accountType = map["account_type"] ?? '0';
    printDM("Sherbini accountType $accountType");
    startDateFullFormat = map["start_date_format_flutter"] ?? '';
    printDM("Sherbini startDateFullFormat $startDateFullFormat");
    endDateFullFormat = map["end_date_format_flutter"] ?? '';
    printDM("Sherbini endDateFullFormat $endDateFullFormat");
    startTimeFullFormat = map["start_time_format_flutter"] ?? '';
    printDM("Sherbini startTimeFullFormat $startTimeFullFormat");
    endTimeFullFormat = map["end_time_format_flutter"] ?? '';
    printDM("Sherbini endTimeFullFormat $endTimeFullFormat");
    deviceToken = map["device_token"] ?? '';
    printDM("Sherbini deviceToken $deviceToken");
    groupId = map["group_id"] ?? 0;
    printDM("Sherbini group_id $groupId");
  }
}

ApplicationStatus _intToStatus(int index) {
  switch (index) {
    case 0:
      return ApplicationStatus.newRequest;
    case 1:
      return ApplicationStatus.newRequest;
    case 2:
      return ApplicationStatus.reviewing;
    case 3:
      return ApplicationStatus.uncompleted;
    case 4:
      return ApplicationStatus.underWay;
    case 5:
      return ApplicationStatus.completed;
    case 6:
      return ApplicationStatus.canceled;
    default:
      return ApplicationStatus.newRequest;
  }
  // if (index == 0) {
  //   return ApplicationCardStatus.newRequest;
  // } else if (index == 1) {
  //   return ApplicationCardStatus.pending;
  // } else if (index == 2) {
  //   return ApplicationCardStatus.reviewing;
  // } else if (index == 3) {
  //   return ApplicationCardStatus.uncompleted;
  // } else if (index == 4) {
  //   return ApplicationCardStatus.underWay;
  // } else if (index == 5) {
  //   return ApplicationCardStatus.completed;
  // } else {
  //   return ApplicationCardStatus.canceled;
  // }
}
