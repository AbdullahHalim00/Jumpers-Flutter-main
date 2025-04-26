import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Bloc/controllers/badge_counter_controller.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';
import 'package:jumper/src/Ui/circle_avatar/custom_icon_avatar.dart';

import '../../Features/shared/ChatsFeature/ui/screens/all_chat_screen.dart';

class MessageBadge extends StatelessWidget {
  const MessageBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "messages".tr,
      child: GetBuilder<MessageBadgeController>(
        init: MessageBadgeController(),
        builder: (controller) {
          return CustomIconAvatar(
            imageUrl: Assets.messageText,
            bannerCount: controller.count,
            onTap: () {
              Get.to(
                () => const AllChatScreen(),
              );
            },
          );
        }
      ),
    );
  }
}
