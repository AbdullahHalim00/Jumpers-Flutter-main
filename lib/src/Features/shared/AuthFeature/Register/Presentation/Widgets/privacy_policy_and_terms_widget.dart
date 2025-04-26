import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/constants/strings/app_strings.dart';
import 'package:jumper/src/Features/shared/TermsAndConditionsFeature/ui/screen/terms_conditions_imports.dart';

class PrivacyPolicyAndTermsWidget extends StatelessWidget {
  const PrivacyPolicyAndTermsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260.w,
      child: RichText(
        text: TextSpan(
          text: 'When_you_register_with_us_you_automatically_agree_to_me'.tr,
          style: TextStyle(
              color: AppColors.titleGray,
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
              fontFamily: AppStrings.fontFamily),
          children: [
            WidgetSpan(
              child: InkWell(
                onTap: () {
                  Get.to(() => const PrivacyScreen());
                },
                child: Text(
                  'Privacy_Policy'.tr + " ",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.titleGreen,
                    fontSize: 12.sp,
                    fontFamily: AppStrings.fontFamily,
                    decoration: TextDecoration.underline,
                    decorationThickness: 1.5.h,
                    decorationStyle: TextDecorationStyle.wavy,
                  ),
                ),
              ),
            ),
            WidgetSpan(
              child: InkWell(
                onTap: () {
                  Get.to(() => const TermsScreen());
                },
                child: Text(
                  'Terms_of_Use'.tr,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.titleGreen,
                    fontSize: 12.sp,
                    fontFamily: AppStrings.fontFamily,
                    decoration: TextDecoration.underline,
                    decorationThickness: 1.5.h,
                    decorationStyle: TextDecorationStyle.wavy,
                  ),
                ),
              ),
            ),
            const TextSpan(text: ' '),
            TextSpan(
              text: 'application_specific'.tr,
              style: TextStyle(
                  color: AppColors.titleGray,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                  fontFamily: AppStrings.fontFamily),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
