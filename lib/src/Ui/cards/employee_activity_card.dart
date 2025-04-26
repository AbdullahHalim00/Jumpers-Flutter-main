import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:jumper/src/Core/constants/decorations/app_Insets.dart';

import '../../Core/constants/colors/app_colors.dart';
import '../../Core/constants/strings/assets.dart';
import '../spaces_and_dividers/spaces.dart';
import '../text/custom_text.dart';

class EmployeeActivityCard extends StatelessWidget {
  final String dateTime;
  final bool isActivityDone;

  const EmployeeActivityCard({
    Key? key,
    required this.dateTime,
    this.isActivityDone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      margin: EdgeInsets.symmetric(vertical: 18.0.h),
      padding: AppInsets.defaultScreenALL,
      decoration: BoxDecoration(
        border: Border.all(
          color: isActivityDone ? AppColors.green : AppColors.containerBorder,
          width: 0.2.w,
        ),
        color: isActivityDone ? AppColors.greenOverlay : AppColors.mainOverlay,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            isActivityDone ? Assets.eventScheduled : Assets.clock,
            height: 20.h,
            width: 20.h,
          ),
          XSpace.light,
          CustomText.subtitle(
            "last_activity".tr + " ",
            fontWeight: FW.regular,
            color: isActivityDone ? AppColors.green : Colors.black87,
          ),
          XSpace.light,
          CustomText.subtitle(
            dateTime,
            fontSize: 12,
            fontWeight: FW.regular,
            color: isActivityDone ? AppColors.green : Colors.black87,
          ),
        ],
      ),
    );
  }
}
