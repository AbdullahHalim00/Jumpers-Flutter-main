import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/jumper_job_model.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/constants/decorations/app_Insets.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';
import 'package:jumper/src/Core/utils/arabic_num_extension.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Features/jumper/ServiceDetailsFeature/ui/screens/imports_service_details.dart';
import 'package:jumper/src/Features/shared/ChatsFeature/bloc/controller/chats_controller.dart';
import 'package:jumper/src/Ui/builders/conditional_builder.dart';
import 'package:jumper/src/Ui/cards/job_application_card.dart';
import 'package:jumper/src/Ui/containers/default_container.dart';
import 'package:jumper/src/Ui/list_tiles/dotted_info_tile.dart';
import 'package:jumper/src/Ui/list_tiles/simple_icon_label_tile.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

import '../../Features/jumper/JobDetailsFeature/ui/jumper_job_details_screen.dart';
import '../../Features/jumper/JumperHomeFeature/bloc/controller/jumper_jobs_controller.dart';
import '../buttons/custom_outlined_button.dart';
import 'application_status_card.dart';

class JumperAcceptedJobCard extends StatelessWidget {
  // final JumperJobState state ;
  final JumperJob job;

  // final VoidCallback? onDetailsPress;
  // final VoidCallback? onMessagePress;

  const JumperAcceptedJobCard({
    Key? key,
    required this.job,
    // this.state=JumperJobState.offer,
    // this.offerTitle,
    //  this.salary,
    // this.address = "",
    // this.workType,
    //  this.contractPeriod,
    // this.acceptDate,
    //  this.onDetailsPress,
    // this.organisationImage,
    // this.organisationName, this.hoursToAccept, this.onMessagePress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("++++++ JumperJob $job +++++++");
    final ChatsController chatsController = Get.find<ChatsController>();
    final JumperJobsController controller = Get.find<JumperJobsController>();
    return GestureDetector(
      onTap: () => Get.to(() => ServiceDetailsScreen(job, 1)),
      child: DefaultContainer(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: AppInsets.defaultScreenALL,
        hasBorder: true,
        isCurvedBorders: true,
        color: AppColors.containerBCGWhite,
        // height: 270.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                // image
                CircleAvatar(
                  backgroundColor: AppColors.buttonCircleBCG,
                  radius: 20.r,
                  child: ConditionalBuilder(
                    condition: job.companyImage != "",
                    onBuild: CircleAvatar(
                      radius: 20.r,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                        job.companyImage,
                      ),
                    ),
                    onFeedBack: CircleAvatar(
                      radius: 20.r,
                      backgroundColor: Colors.transparent,
                      backgroundImage: const AssetImage(
                        Assets.defaultUser,
                      ),
                    ),
                  ),
                ),
                // title
                8.0.ESW(),
                Expanded(
                  child: CustomText(
                    job.companyName,
                    fontSize: 14,
                    fontWeight: FW.semiBold,
                    isOverFlow: true,
                  ),
                ),
                const Spacer(),
                job.status != 1
                    ? ApplicationStatusCard(
                        status: ApplicationStatus.values[job.status])
                    : const ApplicationStatusCard(
                        status: ApplicationStatus.newRequest,
                      ),
              ],
            ),
            11.0.ESH(),
            Row(
              children: [
                // Spacer(),
                Expanded(
                  child: CustomText.subtitle(
                    job.serviceTitle,
                    fontWeight: FW.semiBold,
                    fontSize: 14,
                    isOverFlow: true,
                  ),
                ),
                if (job.salary != 0)
                  FittedBox(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 5.h,
                          ),
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
                            isOverFlow: true,
                            fontWeight: FW.semiBold,
                            fontSize: 14),
                      ],
                    ),
                  ),
              ],
            ),
            6.5.ESH(),
            // address + work Type
            DottedInfoTile.simple(
              firstData: (job.companyAddress != "" ? job.companyAddress : ""),
              secondData: (job.timeTypeTitle != "" ? job.timeTypeTitle : ""),
            ),

            18.0.ESH(),
            if (job.publishedAt != "")
              SimpleIconLabelTile(
                label: "job_accepted_in".tr + job.publishedAt.adN,
                imageUrl: Assets.clock,
              ),

            // accept time

            28.0.ESH(),
            Row(
              children: [
                Expanded(
                  child: CustomOutlinedButton(
                    primaryColor: AppColors.primary,
                    isCurvedBorders: true,
                    onPressed: () => Get.to(() => ServiceDetailsScreen(job, 1)),
                    height: 40.h,
                    child: CustomText(
                      "request_details".tr,
                      fontSize: 13,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                if( (job.status != 6 || job.groupId != 0) && !chatsController.jobEnded(job.groupId) )
                  ...[
                    14.0.ESW(),
                    Expanded(
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
                        },
                        height: 40.h,
                      ),
                    )
                  ]
              ],
            ),
            12.0.ESH(),
            job.status == 4
                ? InkWell(
                    onTap: () {
                      Get.to(() => JumperJobDetailsScreen(dataJumber: job));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.primary, width: 1.w),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: controller.isLoading
                          ? const CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.primary,
                            )
                          : Text(
                              'attendance_record'.tr,
                              style: const TextStyle(
                                fontSize: 17,
                                color: AppColors.primary,
                              ),
                            ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
