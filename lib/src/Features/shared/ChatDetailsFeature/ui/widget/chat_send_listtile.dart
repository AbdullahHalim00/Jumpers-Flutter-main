part of 'imports_widgets_chat_details.dart';

class ChatSendListTile extends StatelessWidget {
  const ChatSendListTile({Key? key, required this.enabled}) : super(key: key);
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final chatController = Get.find<FetchMessagesController>();
    final node = FocusNode();
    return GetBuilder<FetchMessagesController>(
      init: chatController,
      builder: (_) {
        return Column(
          children: [
            /// Send Message ListTile
            Row(
              children: [
                IconButton(
                  splashRadius: 30.r,
                  iconSize: 30.r,
                  onPressed: () {
                    if(enabled) chatController.toggleEmoji();
                  },
                  icon: const Icon(
                    Icons.emoji_emotions_outlined,
                    color: AppColors.black_2,
                  ),
                ),
                16.ESW(),
                Expanded(
                  child: TextFieldDefault(
                    hint: enabled
                      ? "message".tr
                      : "message_not_enabled".tr,
                    enable: enabled,
                    controller: _.messageController,
                    
                    onComplete: () {
                      KeyboardUtils.closeKeyboardIfOpened(context);

                      // _.addMessageToFirebase( );
                      node.unfocus();
                    },
                    onSaved: (value) {
                      KeyboardUtils.closeKeyboardIfOpened(context);
                      // _.addMessageToFirebase( );
                      node.unfocus();
                    },
                  ),
                ),
                16.ESW(),
                ChatSendButton(enabled: enabled),
              ],
            ),

            /// emoji view
            Offstage(
              offstage: !_.emojiShowing,
              child: SizedBox(
                height: 250,
                child: EmojiPicker(
                  onEmojiSelected: (Category? category, Emoji emoji) {
                    _.onEmojiSelected(emoji);
                    // _node.nextFocus();
                  },
                  onBackspacePressed: _.onBackspacePressed,
                  config: Config(
                    columns: 7,
                    // Issue: https://github.com/flutter/flutter/issues/28894
                    emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                    verticalSpacing: 0,
                    horizontalSpacing: 0,
                    // gridPadding: EdgeInsets.zero,
                    initCategory: Category.RECENT,
                    bgColor: const Color(0xFFF2F2F2),
                    indicatorColor: Colors.blue,
                    iconColor: Colors.grey,
                    iconColorSelected: Colors.blue,
                    backspaceColor: Colors.blue,
                    skinToneDialogBgColor: Colors.white,
                    skinToneIndicatorColor: Colors.grey,
                    enableSkinTones: true,
                    showRecentsTab: true,
                    recentsLimit: 28,
                    // replaceEmojiOnLimitExceed: false,
                    noRecents: const Text(
                      'No Recent',
                      style: TextStyle(fontSize: 20, color: Colors.black26),
                      textAlign: TextAlign.center,
                    ),
                    tabIndicatorAnimDuration: kTabScrollDuration,
                    categoryIcons: const CategoryIcons(),
                    buttonMode: ButtonMode.MATERIAL,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
