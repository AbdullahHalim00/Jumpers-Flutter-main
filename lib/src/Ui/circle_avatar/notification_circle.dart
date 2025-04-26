import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

const double _defaultRadius = 8.2;

// min circle is 1/6 smaller then the original one
double _calcMinRadius(double radius) {
  return (radius - (0.16 * radius));
}

class NotificationCircle extends StatelessWidget {
  final int count;

  final double? radius;

  final EdgeInsets? padding;

  const NotificationCircle({
    Key? key,
    required this.count,
    this.radius,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          EdgeInsets.only(
            top: 4.0.h,
          ),
      child: CircleAvatar(
        radius: radius ?? _defaultRadius.r,
        backgroundColor: AppColors.white,
        child: CircleAvatar(
          radius: _calcMinRadius(radius ?? _defaultRadius.r),
          backgroundColor: AppColors.red,
          child: CustomText(
            count.toString().length <= 1 ? "$count" : "+9",
            isOverFlow: true,
            fontSize: 8,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
