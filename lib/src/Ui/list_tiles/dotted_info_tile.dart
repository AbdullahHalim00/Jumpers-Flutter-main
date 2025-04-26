import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';

import '../spaces_and_dividers/spaces.dart';
import '../text/custom_text.dart';

class DottedInfoTile extends StatelessWidget {
  final String? label;

  final String? data;

  const DottedInfoTile({
    Key? key,
    this.label,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: data != "",
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Icon(
              Icons.circle,
              size: 8.r,
            ),
            XSpace.light,
            CustomText.subtitle(
              "$label" ": ",
              fontWeight: FW.light,
            ),
            Expanded(
              child: CustomText(
                "${data ?? ""}  ",
                fontWeight: FW.regular,
                fontSize: 12.sp,
                isOverFlow: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget simple({
    String? firstData,
    String? secondData,
    String? thirdData,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (firstData != null && firstData != "")
                Expanded(
                  // width:200.w,
                  child: CustomText.subtitle(
                    firstData,
                    isOverFlow: true,
                    maxLines: 3,
                    fontWeight: FW.regular,
                    fontSize: 11,
                  ),
                ),
              if (secondData != null && secondData != "") ...[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.h),
                  child: const Icon(
                    Icons.circle,
                    size: 4,
                    color: AppColors.primary,
                  ),
                ),
                CustomText(
                  secondData,
                  isOverFlow: true,
                  fontWeight: FW.medium,
                  color: AppColors.primary,
                  fontSize: 11,
                ),
              ],
            ],
          ),
        ),
        if (thirdData != null && thirdData != "") ...[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.h),
            child: const Icon(
              Icons.circle,
              size: 4,
              color: AppColors.primary,
            ),
          ),
          CustomText(
            thirdData,
            isOverFlow: true,
            fontWeight: FW.medium,
            color: AppColors.primary,
            fontSize: 11,
          ),
        ],
      ],
    );
  }
}
