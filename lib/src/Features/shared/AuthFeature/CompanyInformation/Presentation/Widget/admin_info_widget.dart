import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Bloc/controllers/admin_adjective_controller.dart';
import 'package:jumper/src/Core/services/network/request_status.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CompanyInformation/Logic/organisation_info_controller.dart';
import 'package:jumper/src/Ui/BottomSheet/BottomSheets/admin_adjective_bottom_sheet.dart';
import 'package:jumper/src/Ui/TextFields/text_field_default.dart';
import 'package:jumper/src/Ui/buttons/button_default.dart';
import 'package:jumper/src/Ui/sheets/app_Sheet.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

class AdminIfoWidget extends StatelessWidget {
  final OrganisationController controller;
  final VoidCallback onTap;

  const AdminIfoWidget({
    required this.controller,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AdminAdjectiveController adminAdjectiveController = Get.find();
    var node = FocusScope.of(context);
    return SingleChildScrollView(
      child: Form(
        key: controller.adminDataKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              'admin_info',
              fontWeight: FW.medium,
              fontSize: 16,
            ),
            24.ESH(),
            TextFieldDefault(
              isRequired: false,
              prefixIconUrl: "assets/icons/TFPersonalNameIcon.png",
              hint: "personal_name",
              keyboardType: TextInputType.name,
              controller: controller.adminNameController,
              // validation: (val) =>
              //     AppValidator.validate(val, type: ValidatorType.userName),
              onComplete: () {
                node.nextFocus();
              },
            ),
            24.ESH(),
            TextFieldDefault(
              isRequired: false,
              readOnly: true,
              onTap: () {
                adminAdjectiveController
                    .setAdminAdjectiveID(controller.adminTypeId);
                AppSheet.showDefaultSheet(
                  AdminAdjectiveBottomSheet(onSave: (id, title) {
                    controller.adminTypeController!.text = title;
                    controller.setAdminTypeId(id);
                  }),
                );
              },
              suffixIconData: Icons.keyboard_arrow_down,
              prefixIconUrl: "assets/icons/admin_data.png",
              hint: "admin_adjective",
              controller: controller.adminTypeController,
              // validation: (val) =>
              //     AppValidator.validate(val, type: ValidatorType.adminAdjective),
              onComplete: () {
                node.nextFocus();
              },
            ),
            24.ESH(),
            TextFieldDefault(
              isRequired: false,
              prefixIconUrl: "assets/icons/TFEmailIcon.png",
              hint: "email",
              keyboardType: TextInputType.emailAddress,
              controller: controller.adminEmailController,
              // validation: (val) =>
              //     AppValidator.validate(val, type: ValidatorType.email),
              onComplete: () {
                node.nextFocus();
              },
            ),
            24.ESH(),
            TextFieldDefault(
              isRequired: false,
              prefixIconUrl: "assets/icons/TFPhoneIcon.png",
              hint: "phone_number",
              keyboardType: TextInputType.phone,
              suffixText: "+966",
              controller: controller.adminPhoneController,
              // validation: (val) =>
              //     AppValidator.validate(val, type: ValidatorType.phone),
              onComplete: () {
                node.nextFocus();
              },
            ),
            24.ESH(),
            TextFieldDefault(
              prefixIconUrl: "assets/icons/TFNoteIcon.png",
              hint: "additional_notes",
              keyboardType: TextInputType.name,
              controller: controller.noteController,
              onComplete: () {
                node.unfocus();
              },
            ),
            Center(
              child: BottomRequestStatusBuilder(
                  status: controller.dataState!,
                  bottomWidget: Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    child: ButtonDefault(
                      title: controller.currentPageViewIndex == 0
                          ? controller.organisationTypeId == 0
                              ? '${'continue_us'.tr}${'company'.tr}'
                              : '${'continue_us'.tr}${'CEO'.tr}'
                          : 'start_now',
                      onTap: onTap,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
