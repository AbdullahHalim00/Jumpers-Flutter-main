import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

class CardChoiceWidget extends StatelessWidget {
  final VoidCallback onTap;
  final bool isSelected;
  final String title;
  final String? icon;

  const CardChoiceWidget({
    required this.onTap,
    required this.isSelected,
    required this.title,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(7.r),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                width: 1,
                color: isSelected ? AppColors.primary : AppColors.greyOverlay),
            borderRadius: BorderRadius.circular(7.r),
            color: isSelected
                ? AppColors.primary.withOpacity(.05)
                : Colors.transparent,
          ),
          height: 48.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null
                  ? ImageIcon(
                      AssetImage(icon!),
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.iconDisabled,
                    )
                  : 0.ESH(),
              6.ESW(),
              CustomText(
                title,
                color: isSelected ? AppColors.primary : AppColors.iconDisabled,
              )
            ],
          ),
        ),
      ),
    );
  }
}
