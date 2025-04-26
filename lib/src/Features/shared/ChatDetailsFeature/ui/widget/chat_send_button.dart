part of 'imports_widgets_chat_details.dart';

class ChatSendButton extends StatefulWidget {
  const ChatSendButton({
    Key? key,
    required this.enabled
  }) : super(key: key);
  final bool enabled;

  @override
  State<ChatSendButton> createState() => _ChatSendButtonState();
}

class _ChatSendButtonState extends State<ChatSendButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 450,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chatController = Get.find<FetchMessagesController>();
    return GetBuilder<FetchMessagesController>(
        init: chatController,
        builder: (logic) {
          return CircleAvatar(
            backgroundColor: AppColors.secondary,
            child: IconButton(
              splashColor: AppColors.secondary,
              onPressed: () {
                if(!widget.enabled) return;
                KeyboardUtils.closeKeyboardIfOpened(context);
                _handleButton();
                log(logic.chat.chatId.toString());
                SendChatMessagesParams prams = SendChatMessagesParams(
                  type: logic.chatType,
                  id: logic.chat.id.toString(),
                  message: logic.messageController?.text.trim(),
                );
                chatController
                    .sendMessagesToApi(prams)
                    .then(
                      (value) => logic.messageController?.clear(),
                    )
                    .then((value) =>
                        chatController.loadMessagesFromApi(logic.chatType));
                // logic.addMessageToFirebase();
              },
              icon: ConditionalBuilder(
                condition: 0 == 0, //_.messageController!.text.isNotEmpty
                onBuild: const Icon(
                  Icons.send,
                  color: AppColors.white,
                  semanticLabel: 'Send',
                ),
                onFeedBack: AnimatedIcon(
                  icon: AnimatedIcons.close_menu,
                  progress: _animationController,
                  color: AppColors.white,
                  semanticLabel: 'Add',
                ),
              ),
            ),
          );
        });
  }

  void _handleButton() {
    setState(() {
      _isPlaying = !_isPlaying;
      _isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }
}
