import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

class ChangeEmailTopWidget extends StatelessWidget {
  const ChangeEmailTopWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        32.ESH(),
        CircleAvatar(
          radius: 56.w,
          backgroundColor: AppColors.containerBCGGrey,
          child: Image.asset(
            'assets/icons/checkEmailIcon.png',
            height: 65.w,
            width: 65.w,
          ),
        ),
        24.ESH(),
        const CustomText(
          'change_email_title',
          fontWeight: FW.bold,
        ),
        10.ESH(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 74.w),
          child: CustomText.light(
            'change_email_sub_title',
            // fontSize: 13,
            textAlign: TextAlign.center,
            // color: AppColors.titleGray,
          ),
        ),
      ],
    );
  }
}
