part of 'widgets_imports_chats.dart';

final ScrollController _controller = ScrollController();

class BuildChatBody extends StatelessWidget {
  final List<Chat> chats;
  final String chatType;

  const BuildChatBody({
    Key? key,
    required this.chats,
    required this.chatType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            return ChatCard(
              key: ValueKey(
                chats[index].id,
              ),
              chat: chats[index],
              chatType: chatType,
            );
          }),
    );
  }
}
