import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';

import '../../Core/constants/decorations/app_sizes.dart';

class BaseButton extends StatelessWidget {
  final Color buttonColor;
  final VoidCallback? onTap;
  final double height;
  final double width;
  final Color? borderColor;
  final double radius;
  final Widget? child;

  const BaseButton(
      {Key? key,
      this.borderColor,
      this.child,
      this.radius = AppSizes.nRadius,
      this.buttonColor = AppColors.primary,
      this.onTap,
      this.height = 56,
      this.width = 343})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            debugPrint('hello this tap in button');
          },
      child: Container(
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius.r),
          border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: borderColor != null ? 1 : 0),
          color: buttonColor,
        ),
        child: child ?? const Center(),
      ),
    );
  }
}
