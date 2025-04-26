import 'package:flutter/material.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/shared/ChatsFeature/ui/widgets/widgets_imports_chats.dart';

import '../../../../../Core/constants/decorations/app_physics.dart';
import '../../../../../Ui/spaces_and_dividers/custom_divider.dart';
import '../../bloc/model/chat.dart';

final ScrollController _controller = ScrollController();

class GroupBuildChatBody extends StatelessWidget {
  final List<Chat> chats;

  const GroupBuildChatBody({
    Key? key,
    required this.chats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ToDo groupsMessageFlag
    printDM("meeeeeeee $chats");
    return Scrollbar(
      controller: _controller,
      child: ListView.separated(
        controller: _controller,
        physics: AppPhysics.alwaysScrollablePhysics,
        itemCount: chats.length,
        separatorBuilder: (context, index) {
          return XDivider.semiFaded();
        },
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ChatCard(
            chat: chat,
            chatType: 'group',
          );
        },
      ),
    );
  }
}
