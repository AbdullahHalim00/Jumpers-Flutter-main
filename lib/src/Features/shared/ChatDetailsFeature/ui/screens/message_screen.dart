part of 'imports_chat_details.dart';

class MessagesScreen extends StatefulWidget {
  final Chat chat;
  final String chatType;

  const MessagesScreen({
    Key? key,
    required this.chat,
    required this.chatType,
  }) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  late String chatType;
  late Chat chat;
  @override
  void initState() {
    chat = widget.chat;
    chatType = widget.chatType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(ChatPropertiesController());
    Get.put(FetchMessagesController(
      chat: chat,
      chatType: chatType,
    ));
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        // extendBody: true,
        // extendBodyBehindAppBar: true,

        appBar: const AppBarChatDetails(),
        body: ChatBuilder(
          chatType: chatType,
          enabled: !chat.jobEnded
        ),
      ),
    );
  }
}
