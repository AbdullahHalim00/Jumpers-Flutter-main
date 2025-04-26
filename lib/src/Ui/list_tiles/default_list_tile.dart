import 'package:flutter/material.dart';
import 'package:jumper/src/Ui/builders/conditional_builder.dart';

import '../../Core/constants/colors/app_colors.dart';
import '../containers/default_container.dart';
import '../spaces_and_dividers/spaces.dart';
import '../text/custom_text.dart';

///
class DefaultListTile extends StatelessWidget {
  final String leadingImage;
  final Color? leadingColor;
  final Color? leadingBorderColor;
  final String title;
  final double? titleSize;
  final FW? titleFW;
  final GestureTapCallback? onPressed;
  final Color? color;
  final bool hasBorder;
  final bool isTralilingExpanded;
  final String? trailingText;
  final Widget? trailing;
  final double? leadingImageScale;
  final EdgeInsets? padding;

  const DefaultListTile({
    Key? key,
    required this.leadingImage,
    this.leadingColor,
    this.leadingBorderColor,
    this.title = "",
    this.hasBorder = true,
    this.isTralilingExpanded = true,
    this.onPressed,
    this.color,
    this.leadingImageScale = 1,
    this.trailing,
    this.padding,
    this.trailingText,
    this.titleSize,
    this.titleFW,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: DefaultContainer(
        padding: padding,
        color: color,
        hasBorder: hasBorder,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 21,
                  backgroundColor: leadingBorderColor ?? Colors.transparent,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor:
                        leadingColor ?? AppColors.circleAvatarLighter,
                    // (Get.isDarkMode?AppColors.userAvatarDark:AppColors.userAvatarLight) ,
                    child: Image.asset(
                      // Assets.setting_user,
                      leadingImage,
                      scale: leadingImageScale,
                    ),
                  ),
                ),
                XSpace.light,
                CustomText(
                  title,
                  isUpperCase: true,
                  fontSize: titleSize,
                  fontWeight: titleFW ?? FW.regular,
                ),
              ],
            ),
            // const Spacer(),
            if (trailing != null || trailingText != null)
              ConditionalBuilder(
                condition: trailing != null,
                onBuild: isTralilingExpanded
                    ? Expanded(child: trailing ?? const SizedBox())
                    : trailing ?? const SizedBox(),
                onFeedBack: CustomText(
                  "$trailingText",
                  fontSize: 14,
                  fontWeight: FW.medium,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
