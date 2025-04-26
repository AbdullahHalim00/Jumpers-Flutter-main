import 'package:flutter/material.dart';

import '../../Core/constants/colors/app_colors.dart';
import '../builders/conditional_builder.dart';

class CustomRadio extends StatelessWidget {
  final bool isDark;

  final bool isSelected;

  const CustomRadio({
    Key? key,
    required this.isSelected,
    this.isDark = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: isSelected,
      onBuild: CircleAvatar(
        radius: 12,
        backgroundColor: AppColors.radioDisable.withOpacity(0.5),
        child: const CircleAvatar(
          radius: 10,
          backgroundColor: AppColors.radioEnable_2,
          child: const CircleAvatar(
              radius: 4, backgroundColor: AppColors.circleAvatarLighter
              // (isDark
              //     ? AppColors.mainPrimBCGDark
              //     : AppColors.mainPrimBCGLight),
              ),
        ),
      ),
      onFeedBack: const CircleAvatar(
        radius: 12,
        backgroundColor: AppColors.radioDisable,
        child: const CircleAvatar(
          radius: 10,
          backgroundColor: AppColors.circleAvatarLighter,
          // (isDark
          //     ? AppColors.mainPrimBCGDark
          //     : AppColors.mainPrimBCGLight),
        ),
      ),
    );
  }
}
