// class AddJobSetA {
//
// }

class AddJobParameters {
  int? jobId;
  int? serviceId;
  List<int>? skillsIds;

  // List<int>? languageIds;
  int? requestStatus;
  int? accountTypeId;
  int? price;

  // int? priceTypeId;
  int? gender;
  int? maleNumbers;
  int? femaleNumbers;

  // int? workTypeId;
  int? ageFrom;
  int? ageTo;
  int? jumPerNumbers;
  int? nationalityId;
  String? startDate;
  String? endDate;
  String? startTime;
  String? endTime;
  int? cityId;
  String? description;
  String? companyAddress;
  double? companyLat;
  double? companyLon;
  String? fullAddress;
  int? timeTypeId;
  List<String>? days;
  int? numOfDays;
  String? startDateFullFormat;
  String? endDateFullFormat;
  String? startTimeFullFormat;
  String? endTimeFullFormat;

  AddJobParameters({
    this.jobId,
    required this.serviceId,
    required this.skillsIds,
    // required this.languageIds,
    required this.requestStatus,
    required this.maleNumbers,
    required this.femaleNumbers,
    required this.accountTypeId,
    required this.price,
    // required this.priceTypeId,
    required this.gender,
    // required this.workTypeId,
    required this.ageFrom,
    required this.ageTo,
    required this.jumPerNumbers,
    required this.nationalityId,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.cityId,
    required this.description,
    required this.companyAddress,
    required this.companyLat,
    required this.companyLon,
    required this.fullAddress,
    required this.timeTypeId,
    required this.numOfDays,
    this.days,
    this.startDateFullFormat,
    this.endDateFullFormat,
    this.startTimeFullFormat,
    this.endTimeFullFormat,
  });

  Map<String, dynamic> toMap() {
    return {
      if (jobId != null) 'job_id': jobId,
      'service_id': serviceId,
      'jumber_numbers': jumPerNumbers,
      'nationality_id': nationalityId,
      'gender': gender,
      'male_numbers': maleNumbers,
      'female_numbers': femaleNumbers,
      'age_from': ageFrom,
      'age_to': ageTo,
      'skills_ids[]': skillsIds,
      // 'language_ids[]': languageIds,
      // 'work_type_id': workTypeId,
      'company_address': companyAddress,
      'company_lat': companyLat,
      'company_lon': companyLon,
      'full_address': fullAddress,
      'account_type_id': accountTypeId,
      if (timeTypeId == 1) 'start_date': startDate,
      if (timeTypeId == 1) 'end_date': endDate,
      'time_type_id': timeTypeId,
      'start_time': startTime,
      'end_time': endTime,
      if (timeTypeId == 2) 'days[]': days,
      'price': price,
      // 'price_type_id': priceTypeId,
      'description': description,
      'request_status': requestStatus,
      'number_of_days': numOfDays,
      if (startDateFullFormat != null)
        'start_date_format_flutter': startDateFullFormat,
      if (endDateFullFormat != null)
        'end_date_format_flutter': endDateFullFormat,
      if (startTimeFullFormat != null)
        'start_time_format_flutter': startTimeFullFormat,
      if (endTimeFullFormat != null)
        'end_time_format_flutter': endTimeFullFormat,
      'city_id': cityId,
    };
  }
}

// class AddJobsParams {
//   final int? serviceId;
//
//   final int? jumperNumber;
//
//   final int? nationalityId;
//
//   final int? gender;
//
//   final int? age;
//
//   final int? workTypeId;
//
//   final String? companyAddress;
//
//   final String? companyLat;
//
//   final String? companyLon;
//
//   final String? fullAddress;
//
//   final List<int>? skillsIds;
//
//   final List<int>? languageIds;
//
//   ///
//   final int? accountType;
//
//   final int? workDurationId;
//
//   final String? startDate;
//
//   final String? endDate;
//
//   final int? timeTypeId;
//
//   final String? startTime;
//
//   final String? endTime;
//
//   final double? price;
//
//   final double? priceForID;
//
//   final String? description;
//
//   AddJobsParams({
//     this.serviceId,
//     this.jumperNumber,
//     this.nationalityId,
//     this.gender,
//     this.age,
//     this.workTypeId,
//     this.companyAddress,
//     this.companyLat,
//     this.companyLon,
//     this.fullAddress,
//     this.skillsIds,
//     this.languageIds,
//     this.accountType,
//     this.workDurationId,
//     this.startDate,
//     this.endDate,
//     this.timeTypeId,
//     this.startTime,
//     this.endTime,
//     this.price,
//     this.priceForID,
//     this.description,
//   });
// }
