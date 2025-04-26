import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';

class GenderModel {
  final int? id;
  final String? img;
  final String? label;
  bool isSelected;

  GenderModel._({
    this.id,
    this.img,
    this.label,
    this.isSelected = false,
  });
}

class GenderData {
  GenderData._();

  static final List<GenderModel> _genderList = [
    // GenderModel._(
    //   id: 1,
    //   img: Assets.male,
    //   label: "male".tr,
    //   // isSelected: false,
    // ),
    // GenderModel._(
    //   id: 2,
    //   img: Assets.female,
    //   label: "female".tr,
    //   // isSelected: false,
    // ),
    // GenderModel._(
    //   id: 3,
    //   img: Assets.male_female,
    //   label: "male_female".tr,
    //   // isSelected: false,
    // ),
    GenderModel._(
      id: 3,
      img: Assets.info,
      label: "defined".tr,
      // isSelected: false,
    ),
    GenderModel._(
      id: 4,
      img: Assets.info,
      label: "undefined".tr,
      // isSelected: false,
    ),
    // GenderModel._(
    //   id: 3,
    //   img: Assets.info,
    //   label: "undefined".tr,
    //   isSelected: false,
    // ),
  ];

  static List<GenderModel> get genderList => _genderList;
}
