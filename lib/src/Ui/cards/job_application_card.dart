import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/company_job_model.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/constants/decorations/app_Insets.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';
import 'package:jumper/src/Core/services/audio_service.dart';
import 'package:jumper/src/Core/utils/arabic_num_extension.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/company/job_details/ui/screens/imports_job_details_screen.dart';
import 'package:jumper/src/Ui/builders/applicants_stack_builder.dart';
import 'package:jumper/src/Ui/builders/conditional_builder.dart';
import 'package:jumper/src/Ui/containers/default_container.dart';
import 'package:jumper/src/Ui/list_tiles/dotted_info_tile.dart';
import 'package:jumper/src/Ui/list_tiles/simple_icon_label_tile.dart';
import 'package:jumper/src/Ui/spaces_and_dividers/spaces.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

import '../../Features/company/jobs/ui/screens/all_accepted_employee.dart';
import '../../Features/shared/ChatsFeature/bloc/controller/chats_controller.dart';
import '../buttons/custom_outlined_button.dart';
import 'application_status_card.dart';

enum ApplicationStatus {
  newRequest,
  pending,
  reviewing,
  uncompleted,
  underWay,
  completed,
  canceled,
}

class JobApplicationCard extends StatelessWidget {
  final CompanyJobModel job;
  final VoidCallback? onRemovePressed;

  const JobApplicationCard({
    Key? key,
    required this.job,
    this.onRemovePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("++++++++++++ CompanyJobModel $job +++++++++++++++ ${job.status}");
    final ChatsController chatsController = Get.find<ChatsController>();
    return DefaultContainer(
      margin: EdgeInsets.only(bottom: 15.h),
      padding: AppInsets.defaultScreenALL,
      hasBorder: true,
      isCurvedBorders: true,
      color: AppColors.containerBCGWhite,
      // height: 270.h,
      child: InkWell(
        splashColor: AppColors.secondary,
        onTap: () {
          printDM("JOB STATUS ${job.status}");
          AudioService.playSelect();
          Get.to(() => JobDetailsScreen(
                job: job,
              ));
        },
        onLongPress: () {
          // Utils.showPreviewDialog(
          //   child: SneakyJobDetailsDialog(
          //     job: job,
          //   ),
          //   closeAfterAWhile: false,
          // );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ApplicationStatusCard(status: job.status),
            YSpace.normal,
            // title + salary
            Row(
              children: [
                CustomText(job.serviceTitle,
                    fontWeight: FW.semiBold, fontSize: 14),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.h),
                  child: const Icon(
                    Icons.circle,
                    size: 8,
                    color: AppColors.greyDarker,
                  ),
                ),
                CustomText(
                  job.salary != 0
                      ? "${job.salary.adN} ${"currency_per_day".tr}"
                      : "",
                  fontWeight: FW.semiBold,
                  fontSize: 14,
                ),
              ],
            ),
            6.5.ESH(),
            // address + work Type
            DottedInfoTile.simple(
              firstData: job.companyAddress.adN,
              secondData: job.workTypeTitle,
            ),
            13.0.ESH(),
            // contact + work time
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              child: Row(
                children: [
                  if (job.startDate != "" && job.endDate != "") ...[
                    SimpleIconLabelTile(
                      label: "${job.startDate.adN} - ${job.endDate.adN}",
                      imageUrl: Assets.menu_board,
                    ),
                    14.0.ESW(),
                  ],
                ],
              ),
            ),
            8.0.ESH(),
            if (job.startTimeFormat != "" || job.endTimeFormat != "")
              SimpleIconLabelTile(
                //                label: "${DateUtilities.convertTimeToAmPm(job.startTime)} - ${DateUtilities.convertTimeToAmPm(job.endTime)}",
                label: "${job.startTimeFormat.adN} - ${job.endTimeFormat.adN}",
                imageUrl: Assets.clock,
              ),
            8.0.ESH(),
            // date
            Row(
              children: [
                CustomText(
                  "${"published_at".tr} : ",
                  fontWeight: FW.regular,
                  fontSize: 11,
                ),
                CustomText.subtitle(
                  job.publishedAt.adN,
                  fontWeight: FW.regular,
                  fontSize: 11,
                ),
              ],
            ),
            13.0.ESH(),
            //applicants
            ConditionalBuilder(
              condition: job.applicants.isNotEmpty,
              onBuild: ApplicantsStackBuilder(
                applicants: job.applicants,
              ),
              onFeedBack: Row(
                children: [
                  CustomText(
                    "${"applicants".tr} : ",
                    fontWeight: FW.regular,
                    fontSize: 11,
                  ),
                  CustomText.subtitle(
                    "no_applicants".tr,
                    fontWeight: FW.regular,
                    fontSize: 11,
                  ),
                ],
              ),
            ),
            28.0.ESH(),
            Row(
              children: [
                Expanded(
                  child: CustomOutlinedButton(
                    primaryColor: AppColors.primary,
                    isCurvedBorders: true,
                    onPressed: () {
                      AudioService.playSelect();
                      Get.to(
                        () => JobDetailsScreen(
                          job: job,
                        ),
                      );
                    },
                    height: 40.h,
                    child: CustomText(
                      "request_details".tr,
                      fontSize: 13,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                // if (status == ApplicationCardStatus.newRequest ||
                //     status != ApplicationCardStatus.pending)

                if (onRemovePressed != null) ...[
                  job.status == ApplicationStatus.newRequest ||
                          job.status == ApplicationStatus.reviewing ||
                          job.status == ApplicationStatus.underWay
                      ? XSpace.normal
                      : const SizedBox(
                          width: 0,
                        ),
                  Visibility(
                    visible: job.status == ApplicationStatus.newRequest ||
                        job.status == ApplicationStatus.reviewing ||
                        job.status == ApplicationStatus.underWay,
                    child: (job.status == ApplicationStatus.newRequest ||
                            job.groupId == 0)
                          && job.status != ApplicationStatus.reviewing
                          && job.status != ApplicationStatus.underWay
                        ? Expanded(
                            child: CustomOutlinedButton(
                              primaryColor: AppColors.red,
                              isCurvedBorders: true,
                              onPressed: onRemovePressed,
                              height: 40.h,
                              child: CustomText(
                                "request_delete".tr,
                                fontSize: 13,
                                color: AppColors.red,
                              ),
                            ),
                          )
                        : Expanded(
                            child: CustomOutlinedButton.image(
                              primaryColor: AppColors.primary,
                              label: "send_message".tr,
                              image: const AssetImage(Assets.message_2),
                              isCurvedBorders: true,
                              onPressed: () {
                                chatsController.startChat(
                                  targetID: job.groupId,
                                  targetImage: null,
                                  targetName: null,
                                  targetToken: null,
                                  chatType: 'group',
                                );
                                //  _ChatsController.startChat(
                                //               targetName: employee.name,
                                //               targetID: employee.id,
                                //               targetImage: employee.image,
                                //               targetToken: employee.deviceToken,
                                //               chatType: 'user',
                                //             );
                              },
                              height: 40.h,
                            ),
                          ),
                  ),
                ],
              ],
            ),
            job.status == ApplicationStatus.underWay ||
                    job.status == ApplicationStatus.completed ||
                    job.status == ApplicationStatus.canceled
                ? 12.0.ESH()
                : 0.0.ESH(),
            Visibility(
              visible: job.status == ApplicationStatus.underWay ||
                  job.status == ApplicationStatus.completed,
              child: Row(
                children: [
                  Expanded(
                    child: CustomOutlinedButton(
                      primaryColor: AppColors.primary,
                      isCurvedBorders: true,
                      onPressed: () {
                        AudioService.playSelect();
                        Get.to(AllAcceptedEmployee(job: job));
                      },
                      height: 40.h,
                      child: CustomText(
                        "activities_record".tr,
                        fontSize: 13,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            job.status == ApplicationStatus.completed ? 12.0.ESH() : 0.0.ESH(),
            Visibility(
              visible: job.status == ApplicationStatus.completed,
              child: Row(
                children: [
                  Expanded(
                    child: CustomOutlinedButton(
                      primaryColor: AppColors.primary,
                      isCurvedBorders: true,
                      onPressed: () {
                        AudioService.playSelect();
                        Get.to(() => JobDetailsScreen(
                              job: job,
                              type: 1,
                            ));
                      },
                      height: 40.h,
                      child: CustomText(
                        "Rate Employee".tr,
                        fontSize: 13,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
