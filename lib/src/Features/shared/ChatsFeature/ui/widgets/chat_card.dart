part of 'widgets_imports_chats.dart';

class ChatCard extends StatelessWidget {
  final Chat chat;
  final String chatType;

  const ChatCard({
    Key? key,
    required this.chat,
    required this.chatType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("$chat && ");
    log(" && $chatType");
    return DefaultContainer(
      hasBorder: false,
      child: InkWell(
        // splashColor: Colors.black,
        onTap: () {
          Get.to(
            () => MessagesScreen(
              chat: chat,
              chatType: chatType,
            ),
          );
          // chatsController.navigateToChat(chat: chat);
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              /// image
              CircleAvatar(
                backgroundColor: AppColors.buttonCircleBCG,
                radius: 25.r,
                child: ConditionalBuilder(
                  condition: chat.image != "" && chat.image != null,
                  onBuild: CircleAvatar(
                    radius: 25.r,
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(chat.image!),
                    // backgroundImage: ImageNetwork(
                    //    url:  senderImage,
                    // ),
                  ),
                  onFeedBack: CircleAvatar(
                    radius: 25.r,
                    backgroundColor: Colors.transparent,
                    backgroundImage: const AssetImage(
                      Assets.defaultUser,
                    ),
                  ),
                ),
              ),
              XSpace.hard,

              /// chat
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      "${chat.name}",
                      isUpperCase: true,
                      fontSize: 13,
                      fontWeight: FW.medium,
                      // isOverFlow: true,
                    ),
                    // YSpace.tiny,
                    SizedBox(
                      width: 3000,
                      child: CustomText.subtitle(
                        "${chat.lastMessage?.message}",
                        fontSize: 11,
                        maxLines: 1,
                        fontWeight: FW.medium,
                        isOverFlow: true,
                        color: chat.getMyMessageCount > 0
                            ? AppColors.primary
                            : AppColors.black_2,
                      ),
                    ),
                  ],
                ),
              ),

              /// notification
              if (chat.getMyMessageCount > 0)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText.subtitle(
                      DateUtilities.convertDateToTimeAndAddHours(
                          chat.date!, 12),
                      fontSize: 11,
                      fontWeight: FW.light,
                      maxLines: 1,
                      isOverFlow: true,
                      color: chat.messageCount! > 0
                          ? AppColors.primary
                          : const Color(0xff99999A),
                    ),

                    12.0.ESH(),
                    // if (chat.messageCount! > 0)
                    CircleAvatar(
                      radius: 18.r,
                      backgroundColor: AppColors.white,
                      child: CircleAvatar(
                        radius: (18 - 3).r,
                        backgroundColor: AppColors.primary,
                        child: CustomText(
                          chat.getMyMessageCount.toString(),
                          // chat.messageCount.toString().length <= 1
                          //     ? "${chat.getMyMessageCount()}"
                          //     : "+9",
                          fontSize: 12,
                          fontWeight: FW.semiBold,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
