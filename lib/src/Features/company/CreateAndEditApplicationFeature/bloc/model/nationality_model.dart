import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';

class NationalityModel {
  final int? id;

  final String? label;

  final String? flagImg;
  bool isSelected;

  NationalityModel._({
    this.id,
    this.label,
    this.flagImg,
    this.isSelected = false,
  });
}

class NationalityData {
  NationalityData._();

  static final List<NationalityModel> _nationalities = [
    NationalityModel._(
      id: 1,
      label: "saudi".tr,
      flagImg: Assets.saudiFlag,
    ),
    // NationalityModel._(
    //   id: 2,
    //   label: "non_saudi".tr,
    //   flagImg: Assets.flag,
    // ),
    NationalityModel._(
      id: 2,
      label: "undefined".tr,
      flagImg: Assets.info,
    ),
  ];

  static List<NationalityModel> get nationalities => _nationalities;
}
