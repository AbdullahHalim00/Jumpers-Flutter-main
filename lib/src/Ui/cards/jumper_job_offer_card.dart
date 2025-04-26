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
import 'package:jumper/src/Ui/builders/conditional_builder.dart';
import 'package:jumper/src/Ui/containers/default_container.dart';
import 'package:jumper/src/Ui/list_tiles/dotted_info_tile.dart';
import 'package:jumper/src/Ui/list_tiles/simple_icon_label_tile.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

import '../buttons/custom_outlined_button.dart';

// enum JumperJobState{
//   offer,
//   waitingList,
//   accepted,
// }
class JumperJobOfferCard extends StatelessWidget {
  final JumperJob job;

  // final JumperJobState state ;
  // final String? organisationName;
  // final String? organisationImage;
  // final String? offerTitle;
  // final String? offerDetails;
  //
  // final int? salary;
  //
  // final String? address;
  //
  // final String? workType;
  // final String? workPlace;
  //
  // final String? contractPeriod;
  //
  // final String? workTime;
  //
  // final String? publishDate;
  // final int ? hoursToAccept;

  // final VoidCallback? onDetailsPressed;

  const JumperJobOfferCard({
    Key? key,
    // this.state=JumperJobState.offer,
    // this.offerTitle,
    // this.offerDetails,
    // this.salary,
    // this.address = "",
    // this.workType,
    // this.workPlace,
    // this.contractPeriod,
    // this.workTime,
    // this.publishDate,
    // this.organisationImage,
    // this.organisationName, this.hoursToAccept,
    // this.onDetailsPressed,
    required this.job,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => ServiceDetailsScreen(job, 0)),
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

                if (job.publishedAtDifference != "") ...[
                  const Spacer(),
                  CustomText.subtitle(
                    job.publishedAtDifference,
                    //"${DateUtilities.getTimeFromNow("2022-04-14 05:33:02.207818")}",
                    fontWeight: FW.regular,
                    fontSize: 11,
                  ),
                ],
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
                  Expanded(
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
                        Expanded(
                          child: CustomText(
                              job.salary != 0
                                  ? job.salary.adN + "currency_per_day".tr
                                  : "",
                              isOverFlow: true,
                              fontWeight: FW.semiBold,
                              fontSize: 14),
                        ),
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
              thirdData: (job.workTypeTitle != "" ? job.workTypeTitle : ""),
            ),
            13.0.ESH(),
            // offer details
            CustomText.subtitle(
              (job.description != "" ? job.description : "-"),
              padding: EdgeInsetsDirectional.only(end: 35.w),
              fontWeight: FW.light,
              fontSize: 11,
              isOverFlow: true,
              maxLines: 3,
            ),
            18.0.ESH(),
            // contact + work time
            Row(
              children: [
                if (job.numberOfDays != 0) ...[
                  SimpleIconLabelTile(
                    label: "${job.numberOfDays}",
                    imageUrl: Assets.menu_board,
                  ),
                  14.0.ESW(),
                ],
                if (job.startTimeFormat != "" && job.endTimeFormat != "") ...[
                  SimpleIconLabelTile(
                    label:
                        "${job.startTimeFormat.adN} - ${job.endTimeFormat.adN}",
                    imageUrl: Assets.clock,
                  ),
                  14.0.ESW(),
                ],
                if (job.hoursToAccept != 0)
                  SimpleIconLabelTile(
                    label: "${job.hoursToAccept}" + ("hour_to_accept".tr),
                    imageUrl: Assets.clock,

                    ///,/// change to timer_icon
                  ),
              ],
            ),
            28.0.ESH(),
            // if (onDetailsPressed != null)
            CustomOutlinedButton(
              primaryColor: AppColors.primary,
              child: CustomText(
                "request_details".tr,
                fontSize: 13,
                color: AppColors.primary,
              ),
              isCurvedBorders: true,
              onPressed: () => Get.to(() => ServiceDetailsScreen(job, 0)),
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}
