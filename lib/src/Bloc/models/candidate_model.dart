import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/certificate_model.dart';
import 'package:jumper/src/Bloc/models/title_model.dart';
import 'package:jumper/src/Ui/cards/candidate_card.dart';

class CandidateModel {
  late int id;
  late String name;
  late String email;
  late String phone;
  late String image;
  late num rate_review;
  late num job_employee_review;
  late num distance;
  late List<TitleModel> skills;
  late List<TitleModel> languages;
  late String gender;
  late String cv;
  late String city;
  late String nationality;
  late String about;
  late String service;
  late String address;
  late List<String> serviceImages;
  late int age;
  late String activityDate;
  late String startWorkTime;
  late String endWorkTime;
  late String workType;
  late CandidateState candidateStatus;
  late List<CertificateModel> certificates = [];
  late List<CertificateModel> scientificCertificates = [];
  late List<CertificateModel> experience = [];
  late List<CertificateModel> courses = [];

//<editor-fold desc="Data Methods">

  CandidateModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.rate_review,
    required this.job_employee_review,
    required this.distance,
    required this.skills,
    required this.languages,
    required this.gender,
    required this.cv,
    required this.city,
    required this.nationality,
    required this.about,
    required this.service,
    required this.address,
    required this.serviceImages,
    required this.age,
    required this.activityDate,
    required this.startWorkTime,
    required this.endWorkTime,
    required this.workType,
    required this.candidateStatus,
    required this.certificates,
    required this.experience,
    required this.courses,
    required this.scientificCertificates,
  });

  CandidateModel.fromMap(Map<String, dynamic> map) {
    id = map['id'] ?? 0;
    name = map['name'] ?? "";

    email = map['email'] ?? "";

    phone = map['phone'] ?? "";

    image = map['image'] ?? "";

    rate_review = map['rate_review'] ?? 0;
    job_employee_review = map['job_employee_review'] ?? 0;
    distance = map['distance'] ?? 0;

    skills = map['skills'] != null
        ? List.from(map['skills']).map((e) => TitleModel.fromJson(e)).toList()
        : [];

    languages = map['languages'] != null
        ? List.from(map['languages'])
            .map((e) => TitleModel.fromJson(e))
            .toList()
        : [];

    gender = _genderIs(
      map['gender'] ?? 0,
    );

    cv = map['cv'] ?? "";

    city = map['city'] ?? "";

    nationality = map['nationality'] ?? "";

    about = map['about'] ?? "";

    service = map['service'] ?? "";

    address = map['address'] ?? "";
    serviceImages = List.castFrom<dynamic, String>(map['service_images'] ?? []);

    age = map['age'] ?? 0;

    /// .................. ADD 3 New Keys ..........................
    activityDate = map['activity_date'] ?? "";
    startWorkTime = map['start_work_date'] ?? "";
    endWorkTime = map['end_work_date'] ?? "";
    workType = map['work_type'] ?? "";

    /// ............................................
    candidateStatus = _candidateStatus(map['accepted_employees_status'] ?? 0);
  }
}

String _genderIs(int id) {
  if (id == 1) {
    return "male".tr;
  } else if (id == 2) {
    return "female".tr;
  } else {
    return "male_female".tr;
  }
}

CandidateState _candidateStatus(int num) {
  if (num == 0) {
    return CandidateState.waiting;
  } else if (num == 1) {
    return CandidateState.confirmed;
  } else {
    return CandidateState.unavailable;
  }
}
