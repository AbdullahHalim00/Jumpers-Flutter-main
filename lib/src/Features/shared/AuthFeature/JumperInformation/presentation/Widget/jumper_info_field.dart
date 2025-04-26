import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Bloc/controllers/fetch_cities_controller.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/services/network/request_status.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Core/utils/validator.dart';
import 'package:jumper/src/Features/shared/AuthFeature/JumperInformation/Logic/jumper_personal_info_controller.dart';
import 'package:jumper/src/Ui/TextFields/text_field_default.dart';
import 'package:jumper/src/Ui/buttons/button_default.dart';

class JumperInfoField extends StatelessWidget {
  final JumperPersonalInfoController controller;

  const JumperInfoField({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FetchCitiesController _fetchCitiesController = Get.find();
    var node = FocusScope.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Form(
        key: controller.globalKey,
        child: Column(
          children: [
            24.ESH(),
            TextFieldDefault(
              isRequired: true,
              readOnly: true,
              onTap: () => controller.openDateSheet(context),
              prefixIconUrl: "assets/icons/TFDate.png",
              hint: "date_of_birth",
              suffixIconData: Icons.keyboard_arrow_down,
              hintColor: AppColors.greyPrimary,
              controller: controller.birthdayController,
              keyboardType: TextInputType.number,
              validation: (String? value) =>
                  AppValidator.validate(value, type: ValidatorType.dateOfBirth),
              onComplete: () {
                node.nextFocus();
              },
            ),
            24.ESH(),
            TextFieldDefault(
              isRequired: true,
              readOnly: true,
              onTap: () {
                _fetchCitiesController.setCityID(controller.cityId);
                controller.openCitySheet();
              },
              suffixIconData: Icons.keyboard_arrow_down,
              prefixIconUrl: "assets/icons/TFLocationIcon.png",
              hint: "city",
              keyboardType: TextInputType.name,
              controller: controller.cityController,
              validation: (val) =>
                  AppValidator.validate(val, type: ValidatorType.city),
              onComplete: () {
                node.nextFocus();
              },
            ),
            24.ESH(),
            TextFieldDefault(
              isRequired: true,
              readOnly: true,
              prefixIconUrl: "assets/icons/TFAddressIcon.png",
              hint: "addressTF",
              keyboardType: TextInputType.name,
              controller: controller.addressController,
              onTap: () => controller.moveToMap(),
              validation: (val) =>
                  AppValidator.validate(val, type: ValidatorType.address),
              onComplete: () {
                node.unfocus();
              },
            ),
            24.ESH(),
            BottomRequestStatusBuilder(
              status: controller.dataState!,
              bottomWidget: ButtonDefault(
                title: 'start_now',
                onTap: () {
                  controller.register();
                },
              ),
            ),
            24.ESH(),
          ],
        ),
      ),
    );
  }
}
