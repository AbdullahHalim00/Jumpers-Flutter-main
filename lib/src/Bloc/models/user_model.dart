import 'package:jumper/src/Bloc/models/service.dart';
import 'package:jumper/src/Bloc/models/simple_model.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/jumper/WalletFeature/Bloc/Model/wallet_bank_model.dart';

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.type,
    required this.notifyStatus,
    required this.apiToken,
    required this.companyType,
    required this.image,
    required this.workActivityTitle,
    required this.workActivityId,
    required this.sectorTitle,
    required this.sectorId,
    required this.identityTitle,
    required this.identityId,
    required this.cityTitle,
    required this.cityId,
    required this.responsibleAttributeTitle,
    required this.responsibleAttributeId,
    required this.managerName,
    required this.managerEmail,
    required this.managerPhone,
    required this.managerNote,
    required this.identityNumber,
    required this.crNo,
    required this.skills,
    // required this.languages,
    required this.gender,
    required this.cv,
    required this.city,
    required this.nationality,
    required this.nationalityId,
    required this.about,
    required this.verifyEmail,
    required this.completeInfo,
    required this.birthday,
    required this.address,
    required this.lat,
    required this.lon,
    required this.services,
    // required this.serviceImages,
    this.walletBank,
    required this.deviceToken,
  });

  late final int id;
  late final String name;
  late final String email;
  late final String phone;
  late final int type;
  late bool notifyStatus;
  late final String apiToken;
  late final int companyType;
  late final String image;
  late final String workActivityTitle;
  late final int workActivityId;
  late final String sectorTitle;
  late final int sectorId;
  late final String identityTitle;
  late final int identityId;
  late final String cityTitle;
  late final int cityId;
  late final String responsibleAttributeTitle;
  late final int responsibleAttributeId;
  late final String managerName;
  late final String commercialNumer;
  late final String taxNumber;
  late final String buildingNumber;
  late final String ipanNumber;
  late final String banckAccountNumber;
  late final String managerEmail;
  late final String managerPhone;
  late final String managerNote;
  late final String identityNumber;
  late final String crNo;
  late final List<SimpleModel> skills;

  // late final List<SimpleModel> languages;
  late final int gender;
  late final String cv;
  late final String city;
  late final String nationality;
  late final int nationalityId;
  late final String about;
  late final int verifyEmail;
  late final int completeInfo;
  late final String birthday;
  late final String address;
  late final double lat;
  late final double lon;
  late final List<Service> services;

  // late final List<String> serviceImages;
  WalletBankModel? walletBank;
  late String deviceToken;

  UserModel.fromJson(Map<String, dynamic> json) {
    //("******************* UserModel *******************");
    id = json['id']?.toInt() ?? 0;
    //("UserModel id => $id");
    name = json['name'] ?? "";
    //("UserModel name => $name");
    email = json['email'] ?? "";
    //("UserModel email => $email");
    phone = json['phone'] ?? "";
    //("UserModel phone => $phone");
    type = json['type'] ?? 0;
    //("UserModel type => $type");
    notifyStatus = json['notify_status'] != null
        ? (json['notify_status'] == 1
            ? true
            : json['notify_status'] == 0
                ? false
                : json['notify_status'])
        : json['notify_status'];
    //("UserModel HUNTER => ${json['notify_status'].toString()}");
    //("UserModel notifyStatus => $notifyStatus");

    apiToken = json['api_token'] ?? "";
    //("UserModel apiToken => $apiToken");
    companyType = json['company_type'] ?? 0;
    //("UserModel companyType => $companyType");
    image = json['image'] ?? "";
    //("UserModel image => $image");
    workActivityTitle = json['work_activity_title'] ?? "";
    //("UserModel workActivityTitle => $workActivityTitle");
    workActivityId = json['work_activity_id'] ?? 0;
    //("UserModel workActivityId => $workActivityId");
    sectorTitle = json['sector_title'] ?? "";
    //("UserModel sectorTitle => $sectorTitle");
    sectorId = json['sector_id'] ?? 0;
    //("UserModel sectorId => $sectorId");
    identityTitle = json['identity_title'] ?? "";
    //("UserModel identityTitle => $identityTitle");
    identityId = json['identity_id'] ?? 0;
    //("UserModel identityId => $identityId");
    cityTitle = json['city_title'] ?? "";
    //("UserModel cityTitle => $cityTitle");
    cityId = json['city_id'] ?? 0;
    //("UserModel cityId => $cityId");
    responsibleAttributeTitle = json['responsible_attribute_title'] ?? "";
    //("UserModel responsibleAttributeTitle => $responsibleAttributeTitle");
    responsibleAttributeId = json['responsible_attribute_id'] ?? 0;
    //("UserModel responsibleAttributeId => $responsibleAttributeId");
    managerName = json['manager_name'] ?? "";
    //("UserModel managerName => $managerName");
    managerEmail = json['manager_email'] ?? "";
    //("UserModel managerEmail => $managerEmail");
    managerPhone = json['manager_phone'] ?? "";
    //("UserModel managerPhone => $managerPhone");
    managerNote = json['manager_notes'] ?? '';
    //("UserModel managerNote => $managerNote");
    identityNumber = json['identity_number'] ?? "";
    //("UserModel identityNumber => $identityNumber");

    commercialNumer = json['commercial_register'] ?? "";
    //("UserModel commercialNumer => $commercialNumer");
    taxNumber = json['tax_number'] ?? "";
    //("UserModel taxNumber => $taxNumber");
    buildingNumber = json['building_number'] ?? "";
    //("UserModel buildingNumber => $buildingNumber");
    ipanNumber = json['iban'] ?? "";
    printDM("UserModel ipanNumber => $ipanNumber");
    banckAccountNumber = json['account_number'] ?? "";
    //("UserModel banckAccountNumber => $banckAccountNumber");

    crNo = json['cr_no'] ?? "";
    //("UserModel crNo => $crNo");
    if (json['skills'] != null) {
      skills = List.from(json['skills'])
          .map((e) => SimpleModel.fromJson(e))
          .toList();
    }
    //("UserModel skills => $skills");
    // if (json['languages'] != null) {
    //   languages = List.from(json['languages'])
    //       .map((e) => SimpleModel.fromJson(e))
    //       .toList();
    // }
    gender = json['gender'] ?? 0;
    //("UserModel gender => $gender");

    cv = json['cv'] ?? "";
    //("UserModel cv => $cv");
    city = json['city'] ?? "";
    //("UserModel city => $city");

    nationality = json['nationality'] ?? "";
    //("UserModel nationality => $nationality");

    nationalityId = json['nationality_id'] ?? 0;
    //("UserModel nationalityId => $nationalityId");

    about = json['about'] ?? "";
    //("UserModel about => $about");

    verifyEmail = json['verify_email'] ?? 0;
    //("UserModel verifyEmail => $verifyEmail");
    completeInfo = json['complete_info'] ?? 0;
    //("UserModel completeInfo => $completeInfo");
    birthday = json['birthday'] ?? "";
    //("UserModel birthday => $birthday");
    address = json['address'] ?? "";
    //("UserModel address => $address");
    if (json['lat'] != null && json['lat'] != '') {
      lat = double.parse(json['lat'].toString());
    } else {
      lat = 0.0;
    }
    //("UserModel lat => $lat");
    if (json['lon'] != null && json['lon'] != '') {
      lon = double.parse(json['lon'].toString());
    } else {
      lon = 0.0;
    }
    //("UserModel lon => $lon");

    walletBank = json['wallet_bank'] != null
        ? WalletBankModel.fromJson(json['wallet_bank'])
        : null;

    //("UserModel walletBank => $walletBank");

    services = json['services'] != null
        ? List.from(json['services']).map((e) => Service.fromJson(e)).toList()
        : [];
    //("UserModel services => $services");

    deviceToken = json['device_token'] ?? "";
    //("UserModel deviceToken => $deviceToken");

    //("*************************************************");
  }

  @override
  String toString() {
    return 'UserModel{id: $id, name: $name, email: $email, phone: $phone, type: $type, notifyStatus: $notifyStatus, apiToken: $apiToken, companyType: $companyType, image: $image, workActivityTitle: $workActivityTitle, workActivityId: $workActivityId, sectorTitle: $sectorTitle, sectorId: $sectorId, identityTitle: $identityTitle, identityId: $identityId, cityTitle: $cityTitle, cityId: $cityId, responsibleAttributeTitle: $responsibleAttributeTitle, responsibleAttributeId: $responsibleAttributeId, managerName: $managerName, managerEmail: $managerEmail, managerPhone: $managerPhone, managerNote: $managerNote, identityNumber: $identityNumber, crNo: $crNo, skills: $skills, gender: $gender, cv: $cv, city: $city, nationality: $nationality, nationalityId: $nationalityId, about: $about, verifyEmail: $verifyEmail, completeInfo: $completeInfo, birthday: $birthday, address: $address, lat: $lat, lon: $lon, services: $services, walletBank: $walletBank,   }';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['type'] = type;
    data['notify_status'] = notifyStatus;
    data['api_token'] = apiToken;
    data['company_type'] = companyType;
    data['image'] = image;
    data['work_activity_title'] = workActivityTitle;
    data['work_activity_id'] = workActivityId;
    data['sector_title'] = sectorTitle;
    data['sector_id'] = sectorId;
    data['identity_title'] = identityTitle;
    data['identity_id'] = identityId;

    data['commercial_register'] = commercialNumer;
    data['tax_number'] = taxNumber;
    data['building_number'] = buildingNumber;
    if(ipanNumber.isNotEmpty) data['iban'] = ipanNumber;
    data['account_number'] = banckAccountNumber;

    data['city_title'] = cityTitle;
    data['city_id'] = cityId;
    data['responsible_attribute_title'] = responsibleAttributeTitle;
    data['responsible_attribute_id'] = responsibleAttributeId;
    data['manager_name'] = managerName;
    data['manager_email'] = managerEmail;
    data['manager_phone'] = managerPhone;
    data['manager_notes'] = managerNote;
    data['identity_number'] = identityNumber;
    data['cr_no'] = crNo;
    data['skills'] = skills.map((e) => e.toJson()).toList();
    // _data['languages'] = languages.map((e) => e.toJson()).toList();
    data['gender'] = gender;
    data['cv'] = cv;
    data['city'] = city;
    data['nationality'] = nationality;
    data['nationality_id'] = nationalityId;
    data['about'] = about;
    data['verify_email'] = verifyEmail;
    data['complete_info'] = completeInfo;
    data['birthday'] = birthday;
    data['address'] = address;
    data['lat'] = lat;
    data['lon'] = lon;
    data['wallet_bank'] = walletBank?.toJson();
    data['services'] = services.map((e) => e.toJson()).toList();
    return data;
  }

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    int? type,
    bool? notifyStatus,
    String? apiToken,
    int? companyType,
    String? image,
    String? workActivityTitle,
    int? workActivityId,
    String? sectorTitle,
    int? sectorId,
    String? identityTitle,
    int? identityId,
    String? cityTitle,
    int? cityId,
    String? responsibleAttributeTitle,
    int? responsibleAttributeId,
    String? managerName,
    String? managerEmail,
    String? commercialNumer,
    String? taxNumber,
    String? buildingNumber,
    String? ipanNumber,
    String? banckAccountNumber,
    String? managerPhone,
    String? managerNote,
    String? identityNumber,
    String? crNo,
    List<SimpleModel>? skills,
    int? gender,
    String? cv,
    String? city,
    String? nationality,
    int? nationalityId,
    String? about,
    int? verifyEmail,
    int? completeInfo,
    String? birthday,
    String? address,
    double? lat,
    double? lon,
    List<Service>? services,
    WalletBankModel? walletBank,
    String? deviceToken,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      type: type ?? this.type,
      notifyStatus: notifyStatus ?? this.notifyStatus,
      apiToken: apiToken ?? this.apiToken,
      companyType: companyType ?? this.companyType,
      image: image ?? this.image,
      workActivityTitle: workActivityTitle ?? this.workActivityTitle,
      workActivityId: workActivityId ?? this.workActivityId,
      sectorTitle: sectorTitle ?? this.sectorTitle,
      sectorId: sectorId ?? this.sectorId,
      identityTitle: identityTitle ?? this.identityTitle,
      identityId: identityId ?? this.identityId,
      cityTitle: cityTitle ?? this.cityTitle,
      cityId: cityId ?? this.cityId,
      responsibleAttributeTitle:
          responsibleAttributeTitle ?? this.responsibleAttributeTitle,
      responsibleAttributeId:
          responsibleAttributeId ?? this.responsibleAttributeId,
      managerName: managerName ?? this.managerName,
      managerEmail: managerEmail ?? this.managerEmail,
      managerPhone: managerPhone ?? this.managerPhone,
      managerNote: managerNote ?? this.managerNote,
      identityNumber: identityNumber ?? this.identityNumber,
      crNo: crNo ?? this.crNo,
      skills: skills ?? this.skills,
      gender: gender ?? this.gender,
      cv: cv ?? this.cv,
      city: city ?? this.city,
      nationality: nationality ?? this.nationality,
      nationalityId: nationalityId ?? this.nationalityId,
      about: about ?? this.about,
      verifyEmail: verifyEmail ?? this.verifyEmail,
      completeInfo: completeInfo ?? this.completeInfo,
      birthday: birthday ?? this.birthday,
      address: address ?? this.address,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      services: services ?? this.services,
      walletBank: walletBank ?? this.walletBank,
      deviceToken: deviceToken ?? this.deviceToken,
    );
  }
}
