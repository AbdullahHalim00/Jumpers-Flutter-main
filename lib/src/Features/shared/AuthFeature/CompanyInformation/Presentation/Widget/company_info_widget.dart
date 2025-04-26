import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Bloc/controllers/fetch_cities_controller.dart';
import 'package:jumper/src/Core/services/network/request_status.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Core/utils/validator.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CompanyInformation/Logic/organisation_info_controller.dart';
import 'package:jumper/src/Ui/TextFields/text_field_default.dart';
import 'package:jumper/src/Ui/buttons/button_default.dart';

class CompanyIfoWidget extends StatelessWidget {
  final OrganisationController controller;
  final VoidCallback onTap;

  const CompanyIfoWidget({
    required this.controller,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FetchCitiesController fetchCitiesController = Get.find();
    var node = FocusScope.of(context);
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Form(
        key: controller.organisationTypeKey,
        child: Column(
          children: [
            // TextFieldDefault(
            //   isRequired: true,
            //   readOnly: true,
            //   onTap: () {
            //     AppSheet.showDefaultSheet(
            //       WorkActivityBottomSheet(onSave: (id, title) {
            //         printDM("title selected is $title");
            //         controller.workActivityController!.text = title;
            //         controller.setWorkActivityId(id);
            //       }),
            //     );
            //   },
            //   suffixIconData: Icons.keyboard_arrow_down,
            //   prefixIconUrl: "assets/icons/TFWorkActivity.png",
            //   hint: "work_activity",
            //   keyboardType: TextInputType.name,
            //   controller: controller.workActivityController,
            //   validation: (val) =>
            //       AppValidator.validate(val, type: ValidatorType.userName),
            //   onComplete: () {
            //     node.nextFocus();
            //   },
            // ),
            // 24.ESH(),
            // TextFieldDefault(
            //   isRequired: true,
            //   readOnly: true,
            //   onTap: () {
            //     AppSheet.showDefaultSheet(
            //       SectorsBottomSheet(onSave: (id, title) {
            //         printDM("title selected is $title");
            //         controller.sectorController!.text = title;
            //         controller.setSectorId(id);
            //       }),
            //     );
            //   },
            //   suffixIconData: Icons.keyboard_arrow_down,
            //   prefixIconUrl: "assets/icons/TFFlag.png",
            //   hint: "sector",
            //   keyboardType: TextInputType.name,
            //   controller: controller.sectorController,
            //   validation: (val) =>
            //       AppValidator.validate(val, type: ValidatorType.userName),
            //   onComplete: () {
            //     node.nextFocus();
            //   },
            // ),
            // 24.ESH(),
            // TextFieldDefault(
            //   prefixIconUrl: "assets/icons/TFIDNum.png",
            //   hint: "Commercial_Registration_No",
            //   keyboardType: TextInputType.name,
            //   controller: controller.crNumController,
            //   onComplete: () {
            //     node.nextFocus();
            //   },
            // ),
            // 24.ESH(),

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
                          'Please fill in the necessary information to issue the invoice'
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
              readOnly: true,
              onTap: () {
                fetchCitiesController.setCityID(controller.headquarterCityId);
                controller.openCitiesBottomSheet();
              },
              suffixIconData: Icons.keyboard_arrow_down,
              prefixIconUrl: "assets/icons/TFLocationIcon.png",
              hint: "Headquarter_city",
              keyboardType: TextInputType.name,
              controller: controller.headquarterCityController,
              validation: (val) =>
                  AppValidator.validate(val, type: ValidatorType.userName),
              onComplete: () {
                node.nextFocus();
              },
            ),
            24.ESH(),
            TextFieldDefault(
              isRequired: true,
              readOnly: true,
              prefixIconUrl: "assets/icons/TFNoteIcon.png",
              hint: "Headquarters_address",
              keyboardType: TextInputType.name,
              controller: controller.headquarterAddressController,
              onTap: () => controller.moveToMap(),
              validation: (val) =>
                  AppValidator.validate(val, type: ValidatorType.userName),
              onComplete: () {
                node.unfocus();
              },
            ),
            24.ESH(),
            TextFieldDefault(
              isRequired: true,
              readOnly: false,
              prefixIconUrl: "assets/icons/TFNoteIcon.png",
              hint: "رقم السجل التجاري",
              keyboardType: TextInputType.name,
              controller: controller.commercialNumberController,
              validation: (val) =>
                  AppValidator.validate(val, type: ValidatorType.userName),
              onComplete: () {
                node.unfocus();
              },
            ),
            24.ESH(),
            TextFieldDefault(
              isRequired: true,
              readOnly: false,
              prefixIconUrl: "assets/icons/TFNoteIcon.png",
              hint: "الرقم الضريبي",
              keyboardType: TextInputType.name,
              controller: controller.taxNumberController,
              validation: (val) =>
                  AppValidator.validate(val, type: ValidatorType.userName),
              onComplete: () {
                node.unfocus();
              },
            ),
            24.ESH(),
            TextFieldDefault(
              isRequired: true,
              readOnly: false,
              prefixIconUrl: "assets/icons/TFNoteIcon.png",
              hint: "رقم المبنى",
              keyboardType: TextInputType.name,
              controller: controller.builderNumberController,
              validation: (val) =>
                  AppValidator.validate(val, type: ValidatorType.userName),
              onComplete: () {
                node.unfocus();
              },
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
                node.unfocus();
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
                node.unfocus();
              },
            ),
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
                )),
            SizedBox(
              height: 250.h,
            ),
          ],
        ),
      ),
    );
  }
}
