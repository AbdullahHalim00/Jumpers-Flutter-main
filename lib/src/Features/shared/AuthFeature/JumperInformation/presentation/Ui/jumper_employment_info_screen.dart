import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/constants/decorations/app_physics.dart';
import 'package:jumper/src/Core/services/network/request_status.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Core/utils/storage_util.dart';
import 'package:jumper/src/Core/utils/validator.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/controller/fetch_languages_controller.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/controller/fetch_services_controller.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/controller/fetch_skills_controller.dart';
import 'package:jumper/src/Features/shared/AuthFeature/JumperInformation/Logic/jumpe_employment_info_controller.dart';
import 'package:jumper/src/Features/shared/AuthFeature/JumperInformation/presentation/Widget/uploading_cv_widget.dart';
import 'package:jumper/src/Ui/TextFields/text_field_default.dart';
import 'package:jumper/src/Ui/appbars/default_appbar.dart';
import 'package:jumper/src/Ui/builders/unavailable_builder.dart';
import 'package:jumper/src/Ui/buttons/button_default.dart';
import 'package:jumper/src/Ui/buttons/custom_outlined_button.dart';
import 'package:jumper/src/Ui/buttons/custom_rounded_button.dart';
import 'package:jumper/src/Ui/image_uploaded.dart';
import 'package:jumper/src/Ui/spaces_and_dividers/spaces.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

import '../../../../../../Ui/sheets/app_Sheet.dart';
import '../../../../../company/CreateAndEditApplicationFeature/ui/widgets/imports_widget_create_new_application.dart';

class EmploymentInfoScreen extends StatelessWidget {
  final bool isEdit;

  const EmploymentInfoScreen({this.isEdit = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(JumperEmploymentInfoController(isEdit: isEdit));
    FetchServicesController fetchServicesController =
        Get.put(FetchServicesController());
    FetchSkillsController fetchSkillsController =
        Get.put(FetchSkillsController());
    FetchLanguagesController fetchLanguagesController =
        Get.put(FetchLanguagesController());
    var node = FocusScope.of(context);
    return GetBuilder<JumperEmploymentInfoController>(builder: (_) {
      return Scaffold(
        appBar: AppBars.basic(
            title: 'employment_details',
            isBack: isEdit ? true : false,
            actions: !isEdit
              ? [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: const CustomText("2/3"),
                ),
              ),
            ]: null
          ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: AppPhysics.alwaysScrollablePhysics,
                  child: Form(
                    key: _.globalKey,
                    child: Column(
                      children: [
                        /// CV
                        Builder(builder: (context) {
                          final String cv = DataBase().restoreUserModel().cv;
                          final bool isUploaded =
                              (cv.isNotEmpty) && (cv != null);

                          return UploadingCVWidget(
                            onTap: (cv) {
                              _.setCV(cv);
                            },
                            futureImage: isUploaded ? cv : _.futureCV,
                            isUpload: isUploaded,
                            onRemoveCV: () => _.deleteCv(),
                          );
                        }),
                        24.ESH(),
                        GetBuilder<FetchServicesController>(
                          builder: (serviceLogic) => TextFieldDefault(
                            isRequired: true,
                            readOnly: true,
                            onTap: () {
                              fetchServicesController.setSetSelectedSkillsIds(
                                _.offeredServiceIds,
                                _.offeredServiceTitles,
                              );
                              AppSheet.showDefaultSheet(
                                SheetSelectServiceName(
                                  onConfirmed: (List<int> ids, String value) {
                                    // serviceLogic.getServicesByIds(ids);
                                    _.offeredServiceController!.text = value;
                                    _.addServices(
                                      services:
                                          serviceLogic.getServicesByIds(ids),
                                    );
                                    // _offeredServiceIds = id;
                                  },
                                ),
                              );
                              // _.onServiceTapped();
                            },
                            suffixIconData: Icons.keyboard_arrow_down,
                            prefixIconUrl: "assets/icons/CEOIcon.png",
                            hint: "The_offered_service",
                            keyboardType: TextInputType.name,
                            controller: _.offeredServiceController,
                            validation: (val) => AppValidator.validate(val,
                                type: ValidatorType.offeredService),
                            onComplete: () {
                              node.nextFocus();
                            },
                          ),
                        ),
                        const ProvideServiceData(),
                        TextFieldDefault(
                          isRequired: true,
                          readOnly: true,
                          onTap: () {
                            fetchSkillsController.setSetSelectedSkillsIds(
                              _.skillsIds,
                              _.skillsTitles,
                            );
                            _.onSkillsTapped();
                          },
                          suffixIconData: Icons.keyboard_arrow_down,
                          prefixIconUrl: "assets/icons/TFSkillsIcon.png",
                          hint: "skills",
                          keyboardType: TextInputType.name,
                          controller: _.skillsController,
                          validation: (val) => AppValidator.validate(val,
                              type: ValidatorType.skills),
                          onComplete: () {
                            node.nextFocus();
                          },
                        ),

                        /// Languages removed
                        // 24.ESH(),
                        UnAvailableBuilder(
                          child: TextFieldDefault(
                            isRequired: true,
                            readOnly: true,
                            onTap: () {
                              fetchLanguagesController.setSelectedLangIds(
                                  _.languageIds, _.languageTitles);
                              _.onLanguagesTapped();
                            },
                            suffixIconData: Icons.keyboard_arrow_down,
                            prefixIconUrl: "assets/icons/TFLangIcon.png",
                            hint: "languages",
                            keyboardType: TextInputType.name,
                            controller: _.languagesController,
                            validation: (val) => AppValidator.validate(val,
                                type: ValidatorType.language),
                            onComplete: () {
                              node.nextFocus();
                            },
                          ),
                        ),
                        24.ESH(),
                        TextFieldDefault(
                          isRequired: false,
                          // prefixIconUrl: "assets/icons/TFNoteIcon.png",
                          hint: "T_F_an_introduction_to_me",
                          keyboardType: TextInputType.name,
                          controller: _.introductionToMeController,
                          maxLines: 4,
                          onComplete: () {
                            node.unfocus();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BottomRequestStatusBuilder(
                status: _.dataState!,
                bottomWidget: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: ButtonDefault(
                    title: 'start_now',
                    onTap: () {
                      _.register();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class ProvideServiceData extends StatelessWidget {
  const ProvideServiceData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final JumperEmploymentInfoController jumperEmployeeInfo =
        Get.put(JumperEmploymentInfoController());
    return Container(
      margin: EdgeInsets.only(top: 5.h),
      child: GetBuilder<JumperEmploymentInfoController>(
          // init: _fetchServicesController,
          builder: (logic) {

        return ListView.builder(
            shrinkWrap: true,
            physics: AppPhysics.neverScrollable,
            itemCount: logic.servicesLoad.length,
            itemBuilder: (context, index) {
              log("logic.servicesLoad[index].municipalImage444");
              log(logic.servicesLoad[index].municipalImage.toString());
              log(logic.servicesLoad[index].serviceModel.municipalRequired.toString());
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// title
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 8.0.w),
                    child: CustomText.subtitle(
                      logic.servicesLoad[index].serviceModel.title,
                      fontSize: 12,
                      color: AppColors.green,
                      // isBold: true,
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                    ),
                  ),
                  // images
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (logic.servicesLoad[index].serviceModel.municipalRequired == 1) ...[
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (logic.servicesLoad[index].municipalImage ==
                                    null ||
                                logic.servicesLoad[index].municipalImage == "")
                              CustomOutlinedButton(
                                isCurvedBorders: true,
                                height: 42.h,
                                primaryColor: AppColors.secondary,
                                child: const CustomText(
                                  "add_municipal_image",
                                  color: AppColors.secondary,
                                ),
                                onPressed: () {
                                  logic.addMunicipalImageToServiceLoad(
                                    serviceIndex: index,
                                  );
                                  // logic.addMunicipalImages();
                                },
                              )else
                            //if (logic.servicesLoad[index].municipalImage == "")
                              ...[
                              ImageUploaded(
                                fileImage:
                                    logic.servicesLoad[index].municipalImage!,
                                // "https://jumpers.crazyideaco.com/uploads/users/1001655718003.png",
                                // isUploaded:
                                //     logic.servicesLoad[index].municipalImage !=
                                //         null,
                                onDelete: () {
                                  logic.unSelectMunicipalImageInServiceLoad(
                                      serviceIndex: index);
                                },
                              ),
                            ],
                           //  if (logic.servicesLoad[index].municipalImage != null) ...[
                           //    ImageUploaded(
                           //      fileImage:
                           //      logic.servicesLoad[index].municipalImage!,
                           //      // "https://jumpers.crazyideaco.com/uploads/users/1001655718003.png",
                           //      // isUploaded:
                           //      //     logic.servicesLoad[index].municipalImage !=
                           //      //         null,
                           //      onDelete: () {
                           //        logic.unSelectMunicipalImageInServiceLoad(
                           //            serviceIndex: index);
                           //      },
                           //    ),
                           // ],
                          ],
                        ),
                        YSpace.normal,
                      ],
                      if (logic.servicesLoad[index].serviceModel
                              .imagesRequired ==
                          1)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (0 == 0)
                              CustomRoundedButton(
                                height: 42.h,
                                width: 166.w,
                                backgroundColor: AppColors.secondary,
                                child: const CustomText(
                                  "add_service_images",
                                  color: AppColors.white,
                                ),
                                onPressed: () {
                                  logic.addServiceImagesToServiceLoad(
                                      serviceIndex: index);
                                },
                              ),
                            YSpace.normal,
                            if (logic.servicesLoad[index].serviceImages != null)
                              SizedBox(
                                height: logic.servicesLoad[index].serviceImages!
                                        .isNotEmpty
                                    ? 150.h
                                    : 0,
                                width: double.infinity,
                                child: ListView.builder(
                                  itemCount: logic.servicesLoad[index]
                                      .serviceImages!.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, i) {
                                    return ImageUploaded(
                                      fileImage: logic.servicesLoad[index]
                                          .serviceImages![i],
                                      onDelete: () {
                                        logic
                                            .unSelectServiceImagesInServiceLoad(
                                                serviceIndex: index,
                                                imageIndex: i);
                                      },
                                    );
                                  },
                                ),
                              ),
                          ],
                        ),
                    ],
                  ),
                  // data
                ],
              );
            });
      }),
    );
  }
}
