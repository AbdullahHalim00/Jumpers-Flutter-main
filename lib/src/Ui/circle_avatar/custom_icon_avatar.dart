import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumper/src/Ui/builders/conditional_builder.dart';
import 'package:jumper/src/Ui/circle_avatar/notification_circle.dart';

import '../../Core/constants/colors/app_colors.dart';

enum AvatarBorderType {
  solid,
  outer,
  none,
}

class CustomIconAvatar extends StatelessWidget {
  const CustomIconAvatar({
    Key? key,
    this.imageUrl,
    this.scale,
    this.avatarType = AvatarBorderType.solid,
    this.radius,
    this.isNetworkImage = false,
    this.color,
    this.borderColor,
    this.isDark = false,
    this.onTap,
    this.bannerCount,
    this.customChild,
  }) : super(key: key);

  final String? imageUrl;
  final double? radius;

  final AvatarBorderType avatarType;

  final Color? color;
  final Color? borderColor;

  final double? scale;
  final bool isNetworkImage;
  final bool isDark;
  final int? bannerCount;
  final GestureTapCallback? onTap;
  final Widget? customChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 5.0.h),
      height: radius ?? 32.h,
      width: radius ?? 32.w,
      decoration: _getDecoration(
        avatarType,
        color ?? AppColors.buttonCircleBCG,
        borderColor ?? AppColors.mainBorderDarker,
      ),
      child: ConditionalBuilder(
        condition: customChild != null,
        onBuild: customChild ?? const SizedBox(),
        onFeedBack: Stack(
          alignment: Alignment.topRight,
          children: [
            if (imageUrl != null)
              Center(
                child: InkWell(
                  onTap: onTap,
                  child: ConditionalBuilder(
                    condition: isNetworkImage,
                    onBuild: Image.network(
                      "$imageUrl",
                      scale: scale ?? 4,
                    ),
                    onFeedBack: Image.asset(
                      "$imageUrl",
                      scale: scale ?? 4,
                      // Assets.no_connection
                    ),
                  ),
                ),
              ),
            if (bannerCount != null && bannerCount != 0)
              NotificationCircle(
                  count: bannerCount ?? 0, radius: radius ?? 10.r),
            // if (bannerCount!=0 && bannerCount!=null )
            //   Padding(
            //     padding: EdgeInsetsDirectional.only(top: 3.0.h),
            //     child: CircleAvatar(
            //       radius: (radius != null ? radius! / 2 : 10.r),
            //       backgroundColor: AppColors.white,
            //       child: CircleAvatar(
            //         radius: (radius != null ? radius! / 2 - 2.r : 8.r),
            //         backgroundColor: AppColors.red,
            //         child:   CustomText(
            //           "$bannerCount",
            //           fontWeight: FW.semiBold,
            //           fontSize: 8,
            //           color: Colors.white,
            //         ),
            //       ),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}

BoxDecoration _getDecoration(
    AvatarBorderType avatarType, Color color, Color borderColor) {
  BoxDecoration? decoration;
  switch (avatarType) {
    case AvatarBorderType.solid:
      decoration = BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      );
      break;
    case AvatarBorderType.outer:
      decoration = BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 1.2,
        ),
      );
      break;
    case AvatarBorderType.none:
      decoration = const BoxDecoration(
        color: Colors.transparent,
      );
      break;
  }
  return decoration;
}
