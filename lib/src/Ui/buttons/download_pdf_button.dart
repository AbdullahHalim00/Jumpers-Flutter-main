import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';
import 'package:jumper/src/Ui/buttons/custom_outlined_button.dart';
import 'package:jumper/src/Ui/spaces_and_dividers/spaces.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

class DownloadCVButton extends StatelessWidget {
  final VoidCallback? onPressed;

  final bool isEnabled;

  const DownloadCVButton({
    Key? key,
    this.onPressed,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedButton(
      width: 167.w,
      primaryColor: isEnabled ? AppColors.primary : AppColors.buttonDisabled,
      onPressed: onPressed,
      backgroundColor: AppColors.primary.withOpacity(0.1),
      isEnabled: isEnabled,
      child: Row(
        children: [
          Image.asset(
            isEnabled ? Assets.pdf : Assets.pdfDisabled,
            height: 13.h,
          ),
          XSpace.normal,
          CustomText(
            "download".tr + " CV",
            color: isEnabled ? AppColors.primary : AppColors.buttonDisabled,
            fontSize: 10,
            fontWeight: FW.regular,
          ),
          const Spacer(),
          Image.asset(isEnabled ? Assets.download : Assets.downloadDisabled,
              height: 15.h),
        ],
      ),
    );
  }
}
