import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Features/company/job_details/ui/screens/fav_canditates_screen.dart';
import 'package:jumper/src/Ui/builders/conditional_builder.dart';
import 'package:jumper/src/Ui/buttons/custom_outlined_button.dart';
import 'package:jumper/src/Ui/cards/application_status_card.dart';
import 'package:jumper/src/Ui/cards/job_application_card.dart';
import 'package:jumper/src/Ui/list_tiles/simple_info_tile.dart';
import 'package:jumper/src/Ui/spaces_and_dividers/spaces.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

import '../../Bloc/models/company_job_model.dart';
import '../../Core/constants/strings/assets.dart';
import '../../Features/company/job_details/bloc/controller/job_employees_controller.dart';
import '../../Features/company/job_details/ui/widgets/imports_widgets_job_details_screen.dart';

class JobDetailsCard extends StatelessWidget {
  final ApplicationStatus status;
  final int? jobId;
  final String? jobTitle;
  final String? salary;
  final String? address;
  final String? workType;
  final String? workStartDate;
  final String? workEndDate;
  final String? workStartTime;
  final String? workEndTime;
  final String? fullAddress;
  final bool hidStatus;
  final VoidCallback? onDetailsPress;
  final CompanyJobModel? job;

  const JobDetailsCard({
    Key? key,
    this.job,
    this.jobId,
    this.jobTitle,
    this.salary,
    this.address,
    this.workType,
    this.workStartDate,
    this.workEndDate,
    this.fullAddress,
    required this.status,
    this.onDetailsPress,
    this.workStartTime,
    this.workEndTime,
    this.hidStatus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobEmployeesController>(builder: (controller) {
      final bool paymentDone = (status != ApplicationStatus.uncompleted);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //state
          // basic details
          CustomText.subtitle(
            "basic_details".tr,
            // padding: EdgeInsets.symmetric(vertical: 9.h),
            fontSize: 13,
            fontWeight: FW.regular,
          ),
          9.0.ESH(),
          // if(paymentDone!=null)
          ...[
            // Visibility(
            //   visible: controller.isCanPay,
            //   child: InkWell(
            //     onTap: (){
            //       if(paymentDone){
            //
            //       }
            //     },
            //     child: Container(
            //       width: double.infinity,
            //       height: 30.h,
            //       padding: AppInsets.defaultScreenHorizontal,
            //       color: (!paymentDone)
            //           ? AppColors.greenOverlay
            //           : AppColors.redOverlay,
            //       child: ConditionalBuilder(
            //         condition: (!paymentDone),
            //         onBuild: Row(
            //           children: [
            //             Icon(
            //               Icons.check_circle_outlined,
            //               color: AppColors.green,
            //               size: 12.r,
            //             ),
            //             XSpace.light,
            //             CustomText.subtitle(
            //               "payment_done".tr,
            //               color: AppColors.green,
            //               fontSize: 9,
            //               fontWeight: FW.regular,
            //             ),
            //           ],
            //         ),
            //         onFeedBack: Row(
            //           children: [
            //             Icon(
            //               Icons.error_outline,
            //               color: AppColors.red,
            //               size: 12.r,
            //             ),
            //             XSpace.light,
            //             CustomText.subtitle(
            //               "payment_not_done".tr,
            //               fontSize: 9,
            //               color: AppColors.red,
            //               fontWeight: FW.regular,
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            9.0.ESH(),
          ],
          // required to work
          Row(
            children: [
              CustomText(
                "require_to_work".tr,
                // padding: EdgeInsets.symmetric(vertical: 9.h),
                fontSize: 13,
                fontWeight: FW.light,
                isOverFlow: true,
              ),
              XSpace.normal,
              CustomText(
                "$jobTitle".tr,
                // padding: EdgeInsets.symmetric(vertical: 9.h),
                fontSize: 13,
                fontWeight: FW.semiBold,
                isOverFlow: true,
              ),
              const Spacer(),
              if (!hidStatus) ApplicationStatusCard(status: status),
            ],
          ),
          9.0.ESH(),
          // salary
          Row(
            children: [
              CustomText(
                "Suggested price".tr,
                // padding: EdgeInsets.symmetric(vertical: 9.h),
                fontSize: 13,
                fontWeight: FW.light,
                isOverFlow: true,
              ),
              SizedBox(
                width: 10.w,
              ),
              CustomText(
                "$salary".tr,
                // padding: EdgeInsets.symmetric(vertical: 9.h),
                fontSize: 14,
                fontWeight: FW.regular,
              ),
            ],
          ),
          5.0.ESH(),
          //city address

          Wrap(
            children: [
              Container(
                child: CustomText(
                  '${"address".tr + " :    " + "$address"}',
                  maxLines: 2,
                  // padding: EdgeInsets.symmetric(vertical: 9.h),
                  fontSize: 11.sp,
                  fontWeight: FW.light,
                ),
              ),
            ],
          ),
          5.0.ESH(),
          //city address

          Wrap(
            children: [
              Container(
                child: CustomText(
                  '${"address_detailed".tr + " :     " + "${job!.fullAddress}"}',
                  maxLines: 1,
                  // padding: EdgeInsets.symmetric(vertical: 9.h),
                  fontSize: 11.sp,
                  fontWeight: FW.light,
                ),
              ),
            ],
          ),
          // DottedInfoTile.simple(
          //   firstData: "address".tr,
          //   secondData: "$address",
          //
          // ),
          5.0.ESH(),
          // dates

          SimpleInfoTile(
            label: "start_date".tr,
            data: "$workStartDate",
          ),
          5.0.ESH(),
          SimpleInfoTile(
            label: "end_date".tr,
            data: "$workEndDate",
          ),
          5.0.ESH(),
          SimpleInfoTile(
            label: "work_period".tr,
            data: "$workStartTime - $workEndTime",
          ),
          5.0.ESH(),
          // full address
          CustomText.subtitle(
            "city".tr + ":  " + "${job!.city}",
            fontSize: 11,
            fontWeight: FW.light,
            maxLines: 2,
          ),

          13.0.ESH(),
          if (onDetailsPress != null)
            CustomOutlinedButton(
              child: CustomText(
                "view_all_details".tr,
                fontSize: 13,
                color: AppColors.secondary,
              ),
              isCurvedBorders: true,
              primaryColor: AppColors.secondary,
              onPressed: onDetailsPress,
              height: 45.h,
              width: double.infinity,
            ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  child: ConditionalBuilder(
                    condition: (status == ApplicationStatus.pending),
                    onBuild: PublishRequestButton(jobId!),
                    onFeedBack: status == ApplicationStatus.completed ||
                            status == ApplicationStatus.uncompleted ||
                            status == ApplicationStatus.canceled ||
                            status == ApplicationStatus.underWay ||
                            status == ApplicationStatus.reviewing
                        ? Container(
                            height: 45,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.transparent,
                                border:
                                    Border.all(width: 1, color: Colors.grey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Assets.add,
                                  color: Colors.grey,
                                  width: 25.w,
                                  height: 25.h,
                                ),
                                Text(
                                  "request_more".tr,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          )
                        : RequestMoreCandidatesButton(jobId!),
                  ),
                ),
              ),
              // XSpace.normal,
              // ConditionalBuilder(
              //   condition: (status == ApplicationStatus.newRequest) ||
              //       (status == ApplicationStatus.pending),
              //   onBuild: const SizedBox.shrink(),
              //   onFeedBack: Expanded(child: StopRequestButton(jobId!)),
              // ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          status == ApplicationStatus.completed ||
                  status == ApplicationStatus.uncompleted ||
                  status == ApplicationStatus.canceled ||
                  status == ApplicationStatus.underWay ||
                  status == ApplicationStatus.reviewing
              ? Container(
                  height: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.transparent,
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "employees_fav".tr,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                )
              : InkWell(
                  onTap: () {
                    Get.to(FavCanditatesScreen(job: job));
                  },
                  child: Container(
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.secondary,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "employees_fav".tr,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
        ],
      );
    });
  }
}
