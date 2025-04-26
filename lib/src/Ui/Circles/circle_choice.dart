import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';

class CircleChoice extends StatelessWidget {
  final bool active;

  const CircleChoice({Key? key, this.active = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 21.h,
      width: 21.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.transparent,
        border: Border.all(
            color: active ? AppColors.primary : AppColors.greyPrimary,
            width: active ? 6 : 2,
            style: BorderStyle.solid),
      ),
    );
  }
}
