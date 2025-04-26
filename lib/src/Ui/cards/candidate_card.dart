import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/constants/decorations/app_Insets.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Features/company/job_details/bloc/controller/accept_employee_controller.dart';
import 'package:jumper/src/Features/company/job_details/bloc/controller/refuse_employee_controller.dart';
import 'package:jumper/src/Features/company/job_details/bloc/controller/return_employee_controller.dart';
import 'package:jumper/src/Ui/builders/conditional_builder.dart';
import 'package:jumper/src/Ui/buttons/custom_outlined_button.dart';
import 'package:jumper/src/Ui/buttons/custom_rounded_button.dart';
import 'package:jumper/src/Ui/cards/job_application_card.dart';
import 'package:jumper/src/Ui/containers/default_container.dart';
import 'package:jumper/src/Ui/spaces_and_dividers/spaces.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

import '../../Bloc/models/company_job_model.dart';
import '../../Core/utils/utils.dart';
import '../../Features/company/EmployeesFeature/bloc/controller/fav_employee_controller.dart';
import '../../Features/company/EmployeesFeature/bloc/controller/my_fav_employees_controller.dart';
import '../../Features/company/job_details/ui/screens/rate_booking_screen.dart';

class CandidateCard extends StatelessWidget {
  final Widget? footerWidget;
  final ApplicationStatus? status;
  final String? name;
  final String? userImage;
  final String? jobTitle;
  final String? nationality;
  final String? gender;
  final String? age;
  final VoidCallback? onDetailsPressed;
  final CompanyJobModel? job;
  final CandidateState? candidateState;
  final VoidCallback? onCardLongPress;
  final int? jobID;
  final int? employeeID;

  CandidateCard({
    Key? key,
    this.name,
    this.userImage,
    this.jobTitle,
    this.status,
    this.nationality,
    this.gender,
    this.job,
    this.candidateState,
    this.age,
    this.footerWidget,
    this.onDetailsPressed,
    this.onCardLongPress,
    required this.jobID,
    required this.employeeID,
  }) : super(key: key);

  bool inFav = false;

  @override
  Widget build(BuildContext context) {
    MyFavEmployeesController myFavEmployeesController =
        Get.put(MyFavEmployeesController());
    if (myFavEmployeesController.dataState.data != null) {
      inFav = myFavEmployeesController.dataState.data!
              .where((element) => element.id == employeeID)
              .toList()
              .length >
          0;
    }
    return DefaultContainer(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: AppInsets.defaultScreenALL,
      hasBorder: true,
      isCurvedBorders: true,
      color: AppColors.containerBCGWhite,
      child: InkWell(
        onLongPress: onCardLongPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConditionalBuilder(
                  condition: userImage != "",
                  onBuild: CircleAvatar(
                    // radius: ,
                    backgroundColor: AppColors.circleAvatarDarker,
                    backgroundImage: NetworkImage("$userImage"),
                  ),
                  onFeedBack: const CircleAvatar(
                    // radius: ,
                    backgroundColor: AppColors.circleAvatarDarker,
                    backgroundImage: AssetImage(Assets.defaultUser),
                  ),
                ),
                XSpace.normal,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 170,
                      child: CustomText(
                        name ?? "-",
                        fontWeight: FW.semiBold,
                        fontSize: 14,
                      ),
                    ),
                    9.0.ESH(),
                    CustomText(
                      jobTitle ?? "-",
                      fontSize: 11,
                      maxLines: 3,
                      isOverFlow: true,
                    ),
                    9.0.ESH(),
                    CustomText.subtitle(
                      (nationality ?? "") +
                          " " +
                          (gender ?? "") +
                          " " +
                          (age ?? ""),
                      fontSize: 11,
                    ),
                    25.0.ESH(),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomOutlinedButton(
                      child: CustomText(
                        "details".tr,
                        fontSize: 9,
                        color: AppColors.primary,
                        fontWeight: FW.regular,
                      ),
                      isCurvedBorders: true,
                      primaryColor: AppColors.primary,
                      onPressed: onDetailsPressed,
                      height: 34.h,
                      width: 94.w,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    GetBuilder<FavEmployeeController>(
                        init: FavEmployeeController(),
                        builder: (favController) {
                          return Visibility(
                            visible: candidateState == CandidateState.confirmed,
                            child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 5.w),
                                child: inFav
                                    ? InkWell(
                                        onTap: () async{
                                          await Utils.closeSnackbar();
                                          inFav = false;
                                          favController.update();
                                          var newStatus = await favController.changeFav(
                                            employeeID!,
                                          );
                                          if(newStatus == null){
                                            inFav = true;
                                            favController.update();
                                          }
                                        },
                                        child: Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () async{
                                          await Utils.closeSnackbar();
                                          inFav = true;
                                          favController.update();
                                          var newStatus = await favController.changeFav(
                                            employeeID!,
                                          );
                                          if(newStatus == null){
                                            inFav = false;
                                            favController.update();
                                          }
                                        },
                                        child: Icon(
                                          Icons.favorite_border,
                                        ),
                                      )),
                          );
                        }),
                  ],
                ),
              ],
            ),
            footerWidget ?? const SizedBox(),
          ],
        ),
      ),
    );
  }

  /// ALL Factory are different from the basic one only in footer part

  /// builds [accept],[reject] buttons
  factory CandidateCard.all({
    Key? key,
    String? name,
    String? userImage,
    String? jobDescription,
    String? nationality,
    CompanyJobModel? job,
    CandidateState? candidateState,
    String? gender,
    String? age,
    VoidCallback? onDetailsPressed,
    VoidCallback? onCardLongPress,
    required int jobID,
    required int employeeID,
  }) {
    return CandidateCard(
      key: key,
      userImage: userImage,
      job: job,
      nationality: nationality,
      jobTitle: jobDescription,
      gender: gender,
      age: age,
      name: name,
      candidateState: candidateState,
      onDetailsPressed: onDetailsPressed,
      onCardLongPress: onCardLongPress,
      jobID: jobID,
      employeeID: employeeID,
      footerWidget: Row(
        children: [
          GetBuilder<AcceptEmployeeController>(builder: (accController) {
            return Expanded(
              child: CustomRoundedButton(
                height: 40.h,
                backgroundColor: job!.status == ApplicationStatus.newRequest
                    ? AppColors.secondary
                    : Colors.grey,
                child: CustomText(
                  "accept".tr,
                  color: AppColors.white,
                  fontSize: 12,
                ),
                onPressed: () {
                  if (job.status == ApplicationStatus.newRequest) {
                    accController.acceptEmployee(jobID, employeeID);
                  }
                },
              ),
            );
          }),
          13.0.ESW(),
          GetBuilder<RefuseEmployeeController>(builder: (rejController) {
            return Expanded(
              child: CustomOutlinedButton(
                height: 40.h,
                isCurvedBorders: true,
                primaryColor: job!.status == ApplicationStatus.newRequest
                    ? AppColors.secondary
                    : Colors.grey,
                child: Center(
                  child: CustomText(
                    "refuse".tr,
                    fontSize: 12,
                  ),
                ),
                onPressed: () {
                  if (job.status == ApplicationStatus.newRequest) {
                    rejController.refuseEmployee(jobID, employeeID);
                  }
                },
              ),
            );
          }),
        ],
      ),
    );
  }

  /// builds [accept],[reject] buttons

  factory CandidateCard.accepted({
    Key? key,
    String? name,
    String? userImage,
    String? jobDescription,
    String? nationality,
    String? gender,
    String? age,
    ApplicationStatus? status,
    num? job_employee_review,
    CompanyJobModel? job,
    VoidCallback? onMainPressed,
    VoidCallback? onSecondaryPressed,
    VoidCallback? onDetailsPressed,
    VoidCallback? onCardLongPress,
    required CandidateState candidateState,
    required int jobID,
    required int employeeID,
  }) {
    return CandidateCard(
      key: key,
      userImage: userImage,
      nationality: nationality,
      jobTitle: jobDescription,
      gender: gender,
      candidateState: candidateState,
      age: age,
      job: job,
      name: name,
      onDetailsPressed: onDetailsPressed,
      onCardLongPress: onCardLongPress,
      jobID: jobID,
      employeeID: employeeID,
      footerWidget: Builder(builder: (context) {
        switch (candidateState) {
          case CandidateState.waiting:
            return Row(
              children: [
                Expanded(
                  child: AbsorbPointer(
                    absorbing: true,
                    child: CustomRoundedButton.image(
                      height: 40.h,
                      backgroundColor: AppColors.greyOverlay,
                      label: "waiting_for_confirmation".tr,
                      color: AppColors.iconDisabled,
                      image: const AssetImage(
                        Assets.clock,
                      ),
                      side: 15.0.r,
                      onPressed: onMainPressed,
                    ),
                  ),
                ),
                13.0.ESW(),
                GetBuilder<RefuseEmployeeController>(
                    builder: (refuseController) {
                  return Expanded(
                    child: CustomOutlinedButton(
                        height: 40.h,
                        isCurvedBorders: true,
                        primaryColor:
                            job!.status == ApplicationStatus.newRequest
                                ? AppColors.red
                                : Colors.grey,
                        child: Center(
                          child: CustomText(
                            "refuse".tr,
                            fontSize: 12,
                            color: job.status == ApplicationStatus.newRequest
                                ? AppColors.red
                                : Colors.grey,
                          ),
                        ),
                        onPressed: () {
                          if (job.status == ApplicationStatus.newRequest) {
                            refuseController.refuseEmployee(jobID, employeeID);
                          }
                        }),
                  );
                }),
              ],
            );
          case CandidateState.confirmed:
            return GetBuilder<AcceptEmployeeController>(builder: (_) {
              return job_employee_review != 0
                  ? RatingBar(
                      itemSize: 18,
                      initialRating: job_employee_review!.toDouble(),
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,

                      ratingWidget: RatingWidget(
                        full: Image.asset(
                          'assets/images/rate_full.png',
                          width: 18.w,
                          height: 18.h,
                        ),
                        half: Image.asset(
                          'assets/images/rate_full.png',
                          width: 18.w,
                          height: 18.h,
                        ),
                        empty: Image.asset(
                          'assets/images/rate_empty.png',
                          width: 18.w,
                          height: 18.h,
                        ),
                      ),
                      // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    )
                  : CustomOutlinedButton.image(
                      height: 40.h,
                      isCurvedBorders: true,
                      primaryColor:
                          candidateState == CandidateState.confirmed &&
                                  status == ApplicationStatus.completed
                              ? AppColors.black
                              : AppColors.green,
                      backgroundColor:
                          candidateState == CandidateState.confirmed &&
                                  status == ApplicationStatus.completed
                              ? AppColors.white
                              : AppColors.greenOverlay,
                      label: candidateState == CandidateState.confirmed &&
                              status == ApplicationStatus.completed
                          ? "Rate Employee".tr
                          : "accept_candidate".tr,
                      innerColor: candidateState == CandidateState.confirmed &&
                              status == ApplicationStatus.completed
                          ? AppColors.black
                          : AppColors.green,
                      image: candidateState == CandidateState.confirmed &&
                              status == ApplicationStatus.completed
                          ? AssetImage(Assets.rate)
                          : const AssetImage(Assets.checkGreen),
                      side: 15.0.r,
                      onPressed: () {
                        if (candidateState != CandidateState.confirmed) {
                          _.acceptEmployee(jobID, employeeID);
                        } else if (candidateState == CandidateState.confirmed &&
                            status == ApplicationStatus.completed) {
                          Get.to(RateBookingScreen(
                            jobID: jobID,
                            employeeID: employeeID,
                          ));
                        }
                      },
                    );
            });
          case CandidateState.unavailable:
            return GetBuilder<RefuseEmployeeController>(
                builder: (rejContoller) {
              return CustomOutlinedButton.image(
                height: 40.h,
                isCurvedBorders: true,
                primaryColor: AppColors.red,
                backgroundColor: AppColors.redOverlay,
                label: "reject_candidate".tr,
                innerColor: AppColors.red,
                image: const AssetImage(Assets.closeRed),
                side: 15.0.r,
                onPressed: () {
                  if (candidateState != CandidateState.unavailable) {
                    rejContoller.refuseEmployee(jobID, employeeID);
                  }
                },
              );
            });
        }
      }),
    );
  }

  factory CandidateCard.rejected({
    Key? key,
    String? name,
    String? userImage,
    String? jobDescription,
    String? nationality,
    String? gender,
    String? age,
    CompanyJobModel? job,
    CandidateState? candidateState,
    required int jobID,
    required int employeeID,
    VoidCallback? onMainPressed,
    VoidCallback? onDetailsPressed,
    VoidCallback? onCardLongPress,
  }) {
    return CandidateCard(
      key: key,
      userImage: userImage,
      nationality: nationality,
      jobTitle: jobDescription,
      gender: gender,
      age: age,
      job: job,
      name: name,
      candidateState: candidateState,
      onDetailsPressed: onDetailsPressed,
      onCardLongPress: onCardLongPress,
      jobID: jobID,
      employeeID: employeeID,
      footerWidget: Builder(builder: (context) {
        // AcceptEmployeeController acceptEmployeeController = Get.find();
        return GetBuilder<ReturnEmployeeController>(
            builder: (returnController) {
          return CustomRoundedButton.image(
            height: 40.h,
            color: AppColors.white,
            backgroundColor: job!.status == ApplicationStatus.newRequest
                ? AppColors.primary
                : Colors.grey,
            label: "restore_candidate".tr,
            image: const AssetImage(Assets.reload),
            side: 15.0.r,
            onPressed: () {
              if (job.status == ApplicationStatus.newRequest) {
                returnController.restore(jobID, employeeID);
              }
            },
          );
        });
      }),
    );
  }
}

enum CandidateState {
  waiting,
  confirmed,
  unavailable,
}
