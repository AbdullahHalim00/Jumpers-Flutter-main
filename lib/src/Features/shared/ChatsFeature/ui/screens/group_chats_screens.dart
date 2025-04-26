import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../bloc/controller/chats_controller.dart';
import '../widgets/group_build_chats_body.dart';

class GroupChatsScreen extends StatelessWidget {
  const GroupChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatsController>(
      init: ChatsController(),
      builder: (_) {
        return GroupBuildChatBody(chats: _.groupChats);
      },
    );
  }
}
