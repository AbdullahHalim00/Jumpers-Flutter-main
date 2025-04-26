import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Bloc/controllers/fetch_identities_controller.dart';
import 'package:jumper/src/Core/services/network/request_status.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Core/utils/validator.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CompanyInformation/Logic/organisation_info_controller.dart';
import 'package:jumper/src/Ui/TextFields/text_field_default.dart';
import 'package:jumper/src/Ui/buttons/button_default.dart';

class BusinessOwnerIfoWidget extends StatelessWidget {
  final OrganisationController controller;
  final VoidCallback onTap;

  const BusinessOwnerIfoWidget({
    required this.controller,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FetchIdentitiesController identitiesController = Get.find();
    return SingleChildScrollView(
      child: Form(
        key: controller.organisationNewTypeKey,
        child: Column(
          children: [
            // TextFieldDefault(
            //   isRequired: true,
            //   readOnly: true,
            //   onTap: () {
            //     _identitiesController.setIdentitiesID(controller.identityTypeId);
            //     AppSheet.showDefaultSheet(
            //       IdentitiesBottomSheet(
            //           idSelected: controller.identityTypeId,
            //           onSave: (id, title) {
            //         printDM("title selected is $title");
            //         controller.identityTypeIdController!.text = title;
            //         controller.setIdentityTypeId(id);
            //       }),
            //     );
            //   },
            //   suffixIconData: Icons.keyboard_arrow_down,
            //   prefixIconUrl: "assets/icons/TFIDType.png",
            //   hint: "ID_type",
            //   keyboardType: TextInputType.name,
            //   controller: controller.identityTypeIdController,
            //   validation: (val) =>
            //       AppValidator.validate(val, type: ValidatorType.userName),
            //   onComplete: () {
            //     // node.nextFocus();
            //   },
            // ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.red.withOpacity(.1),
                  border: Border.all(color: Colors.red, width: .8.w)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.info_outline,
                    color: Colors.red,
                    size: 22,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Note'.tr,
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'please add Bank account to transfer funds refunds'
                              .tr,
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            24.ESH(),
            TextFieldDefault(
              isRequired: true,
              readOnly: false,
              prefixIconUrl: "assets/icons/TFNoteIcon.png",
              hint: "رقم الايبان",
              keyboardType: TextInputType.name,
              controller: controller.ipanNumberController,
              validation: (val) =>
                  AppValidator.validate(val, type: ValidatorType.userName),
              onComplete: () {
                // node.unfocus();
              },
            ),
            24.ESH(),
            TextFieldDefault(
              isRequired: true,
              readOnly: false,
              prefixIconUrl: "assets/icons/TFNoteIcon.png",
              hint: "رقم الحساب البنكي",
              keyboardType: TextInputType.name,
              controller: controller.bankAccountNumberController,
              validation: (val) =>
                  AppValidator.validate(val, type: ValidatorType.userName),
              onComplete: () {
                // node.unfocus();
              },
            ),
            // 24.ESH(),
            // TextFieldDefault(
            //   prefixIconUrl: "assets/icons/TFIDNum.png",
            //   hint: "ID_num",
            //   keyboardType: TextInputType.number,
            //   controller: controller.identityNumController,
            //   validation: (val) =>
            //       AppValidator.validate(val, type: ValidatorType.userName),
            //   onComplete: () {
            //     // node.nextFocus();
            //   },
            // ),
            BottomRequestStatusBuilder(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
