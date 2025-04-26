part of 'imports_chats.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatsController>(
      init: ChatsController(),
      builder: (_) {
        return BuildChatBody(
          chats: _.chats,
          chatType: 'user',
        );
      },
    );
  }
}
