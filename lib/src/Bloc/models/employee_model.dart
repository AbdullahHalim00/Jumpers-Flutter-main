import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/certificate_model.dart';
import 'package:jumper/src/Bloc/models/title_model.dart';

class EmployeeModel {
  late int id;
  late String name;
  late String email;
  late String phone;
  late String image;
  late List<TitleModel> skills;
  late List<TitleModel> languages;
  late String gender;
  late String cv;
  late String city;
  late String nationality;
  late String about;
  late String service;
  late int age;
  late String address;
  late List<String> serviceImages;
  late String activityDate;
  late String startWorkTime;
  late String endWorkTime;
  late String workType;
  late String startWorkDate;
  late String endWorkDate;
  late List<String> days;
  late List<CertificateModel> certificates = [];
  late List<CertificateModel> scientificCertificates = [];
  late List<CertificateModel> experience = [];
  late List<CertificateModel> courses = [];
  late String deviceToken;
  late bool isFav;

  // late String addedDate ;

//<editor-fold desc="Data Methods">

  EmployeeModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
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
    required this.startWorkDate,
    required this.endWorkDate,
    required this.days,
    required this.certificates,
    required this.experience,
    required this.courses,
    required this.scientificCertificates,
    required this.deviceToken,
    required this.isFav,
    // required this.addedDate,
  });

  EmployeeModel.fromMap(Map<String, dynamic> map) {
    id = map['id'] ?? 0;
    name = map['name'] ?? "";

    email = map['email'] ?? "";

    phone = map['phone'] ?? "";

    image = map['image'] ?? "";

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

    activityDate = map['activity_date'] ?? "";
    startWorkTime = map['start_work_date'] ?? "";
    endWorkTime = map['end_work_date'] ?? "";
    workType = map['work_type'] ?? "";

    startWorkDate = map['start_work_date'] ?? "";
    endWorkDate = map['end_work_date'] ?? "";
    days = List.castFrom<dynamic, String>(map['days'] ?? []);
    deviceToken = map['device_token'] ?? "";
    isFav = map['is_fav'] ?? false;
    // addedDate = map['added_date'] ?? "";
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
