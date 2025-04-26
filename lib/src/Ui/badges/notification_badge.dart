import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Bloc/controllers/badge_counter_controller.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';
import 'package:jumper/src/Features/shared/NotificationsFeature/ui/screens/imports_notifications.dart';
import 'package:jumper/src/Ui/circle_avatar/custom_icon_avatar.dart';

class NotificationBadge extends GetView<NotificationBadgeController> {
  const NotificationBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "notifications".tr,
      child: GetBuilder<NotificationBadgeController>(
        id: 'notification',
        builder: (context) {
          return CustomIconAvatar(
            imageUrl: Assets.notification,
            bannerCount: controller.count,
            onTap: () => Get.to(
              () => const NotificationScreen(),
            ),
          );
        }
      ),
    );
  }
}
