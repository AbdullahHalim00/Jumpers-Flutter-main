import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumper/src/Core/utils/extensions.dart';

import '../../Core/constants/colors/app_colors.dart';

class DashLine extends StatelessWidget {
  final int count;

  const DashLine({Key? key, this.count = 10}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.h,
      child: ListView.separated(
        itemBuilder: (context, index) => Container(
          width: 5.w,
          height: 1.h,
          color: AppColors.cardBCG,
        ),
        itemCount: count,
        separatorBuilder: (context, index) => 4.0.ESW(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
