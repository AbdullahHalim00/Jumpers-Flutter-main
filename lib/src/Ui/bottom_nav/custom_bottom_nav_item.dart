import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Ui/circle_avatar/notification_circle.dart';
import 'package:jumper/src/Ui/spaces_and_dividers/spaces.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

class CustomBottomNavItem {
  CustomBottomNavItem._();

  static BottomNavigationBarItem defaultBottomNavItem({
    required String label,
    required String activeImage,
    required String disActiveImage,
    int? notificationCount,
  }) {
    return BottomNavigationBarItem(
      icon: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            children: [
              ImageIcon(
                AssetImage(disActiveImage),
                size: 26.h,
                semanticLabel: label,
              ),
              YSpace.light,
              CustomText.subtitle(
                label.tr,
                fontSize: 11,
                fontWeight: FW.semiBold,
                color: AppColors.greyPrimary,
              ),
            ],
          ),
          if (notificationCount != null && notificationCount != 0)
            NotificationCircle(
              count: notificationCount,
              radius: 8.2.r,
              padding: const EdgeInsets.only(bottom: 2.0),
            ),
        ],
      ),
      activeIcon: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            children: [
              ImageIcon(
                AssetImage(activeImage),
                size: 26.h,
                color: AppColors.primary,
                semanticLabel: label,
              ),

              YSpace.light,
              CustomText(
                label,
                fontSize: 11,
                fontWeight: FW.semiBold,
                color: AppColors.primary,
              ),
              // Icon(CupertinoIcons.home),
            ],
          ),
          if (notificationCount != null && notificationCount != 0)
            NotificationCircle(
                count: notificationCount,
                radius: 9.2.r,
                padding: const EdgeInsets.only(bottom: 2.0)),
        ],
      ),
      label: label,
    );
  }
}
