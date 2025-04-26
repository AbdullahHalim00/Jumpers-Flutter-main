import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/constants/decorations/app_Insets.dart';
import 'package:jumper/src/Core/constants/decorations/app_sizes.dart';
import 'package:jumper/src/Ui/radio/custom_radio.dart';
import 'package:jumper/src/Ui/spaces_and_dividers/spaces.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

class CustomRadioTile extends StatelessWidget {
  final String label;
  final Widget? suffixWidget;

  final bool isSelected;

  final Function? onTap;

  const CustomRadioTile({
    Key? key,
    required this.label,
    required this.isSelected,
    this.onTap,
    this.suffixWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.h),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSizes.nCardRadius),
        onTap: () {
          onTap!();
          // Get.back();
        },
        child: Container(
          padding: AppInsets.defaultScreenALL,
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.greyOverlay.withOpacity(0.2)
                : AppColors.transparent,
            border: Border.all(
                color:
                    isSelected ? AppColors.secondary : AppColors.greyOverlay),
            borderRadius: BorderRadius.circular(AppSizes.nCardRadius),
          ),
          child: Row(
            children: [
              if (suffixWidget != null) ...[
                suffixWidget ?? const SizedBox.shrink(),
                XSpace.normal,
              ],
              CustomText(
                label,
              ),
              const Spacer(),
              CustomRadio(
                isSelected: isSelected,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
