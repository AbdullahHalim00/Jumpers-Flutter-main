import 'package:flutter/material.dart';

import '../../Core/constants/colors/app_colors.dart';

class DefaultContainer extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final Widget child;
  final Color? color;
  final Color? borderColor;
  final bool hasBorder;
  final bool isCurvedBorders;

  final bool isDark;

  const DefaultContainer({
    Key? key,
    required this.child,
    this.padding,
    this.margin,
    this.hasBorder = true,
    this.color,
    this.borderColor,
    this.height,
    this.width,
    this.isDark = false,
    this.isCurvedBorders = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? AppColors.containerBCGWhite,
        // (
        //    Get.isDarkMode
        //         ? AppColors.mainPrimBCGDark
        //         : AppColors.mainPrimBCGLight
        // ),
        borderRadius: hasBorder
            ? (isCurvedBorders ? BorderRadius.circular(10.0) : null)
            : null,
        border: hasBorder
            ? Border.all(
                color: borderColor ?? AppColors.containerBorder,
                // (Get.isDarkMode?AppColors.borderDark: AppColors.borderLight),
                width: .5,
              )
            : null,
      ),
      padding: padding ?? const EdgeInsets.all(0),
      child: child,
    );
  }
}
