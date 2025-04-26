import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumper/src/Core/utils/extensions.dart';

import '../../Core/constants/colors/app_colors.dart';
import '../../Core/constants/decorations/app_sizes.dart';
import '../text/custom_text.dart';
import 'base_button.dart';

enum ButtonStyle { withBorder, withOutBorder }

class ButtonDefault extends StatelessWidget {
  final String title;
  final String iconImage;
  final Color buttonColor;
  final Color disActiveButtonColor;
  final Color titleColor;
  final Color iconColor;
  final VoidCallback? onTap;
  final double height;
  final double width;
  final double radius;
  final double titleSize;
  final double iconHeight;
  final Color? borderColor;
  final Color disActiveBorderColor;
  final bool? active;
  final Widget? child;

  const ButtonDefault(
      {Key? key,
      this.child,
      this.borderColor,
      this.disActiveButtonColor = AppColors.buttonDisabled,
      this.disActiveBorderColor = AppColors.buttonDisabled,
      this.titleSize = 14,
      this.iconHeight = 12,
      this.radius = AppSizes.nRadius,
      this.title = '',
      this.iconImage = '',
      this.buttonColor = AppColors.secondary,
      this.titleColor = Colors.white,
      this.iconColor = Colors.white,
      this.onTap,
      this.height = 60,
      this.width = 343,
      this.active = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      height: height.h,
      width: width.w,
      radius: radius.r,
      borderColor: active! ? borderColor : disActiveBorderColor,
      buttonColor: active! ? buttonColor : disActiveButtonColor,
      onTap: onTap,
      child: child ?? drawChild(),
    );
  }

  Widget drawChild() {
    if (title.isNotEmpty && iconImage.isEmpty) {
      //  return text only
      return Center(
        child: CustomText(
          title,
          color: titleColor,
          fontSize: titleSize,
          fontWeight: FW.medium,
        ),
      );
    } else if (title.isEmpty && iconImage.isNotEmpty) {
      //  return icon only
      return Center(
          child: Image.asset(
        'assets/icons/$iconImage',
        color: iconColor,
        height: iconHeight,
      ));
    } else if (title.isNotEmpty && iconImage.isNotEmpty) {
      //  return icon and text
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              title,
              color: titleColor,
              fontSize: titleSize,
              fontWeight: FW.semiBold,
            ),
            7.0.ESW(),
            Image.asset(
              'assets/icons/$iconImage',
              color: iconColor,
              height: iconHeight,
            )
          ],
        ),
      );
    } else {
      //  return text only
      return Center(
        child: CustomText(
          title,
          color: titleColor,
          fontSize: titleSize,
          fontWeight: FW.semiBold,
        ),
      );
    }
  }
}
