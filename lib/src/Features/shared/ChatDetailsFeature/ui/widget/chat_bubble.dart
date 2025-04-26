part of 'imports_widgets_chat_details.dart';

const Radius _bubbleRadius = Radius.circular(20.0);

class ChatBubble extends StatelessWidget {
  final Messages message;

  const ChatBubble({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSender = (DataBase().restoreUserModel().id.toString() !=
        message.toId.toString());
    printDM("IS SENDER $isSender");
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
          isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          // padding: AppInsets.defaultScreenALL,
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),

          decoration: BoxDecoration(
            // color: isSender ? AppColors.secondary : Colors.black26.withAlpha(20),
            color:
                isSender ? AppColors.secondary : Colors.black54.withAlpha(20),
            borderRadius: BorderRadius.only(
              topRight: isSender ? _bubbleRadius : Radius.zero,
              topLeft: _bubbleRadius,
              bottomRight: _bubbleRadius,
              bottomLeft: !isSender ? _bubbleRadius : Radius.zero,
            ),
          ),
          child: Html(
            
            // mohammed-saleh change shrinkWrap to:
            shrinkToFit: true,

            data: "${message.message}",
            // style: TextStyle(
            //   fontWeight: FontWeight.normal,
            //   fontSize: 12,
            //   color: isSender ? AppColors.white : AppColors.black,
            // ),
          ),
        ),
        Row(
          crossAxisAlignment:
              isSender ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText.subtitle(
              message.time!,
              // "${message.date!}",
              fontWeight: FW.regular,
              fontSize: 12,
              color: const Color(0xffA1A8B0),
              isOverFlow: true,
            ),
            8.ESW(),
            // getSeenStatusIcon(message.seenStatus!),
          ],
        ),
      ],
    );
  }
}

Widget getSeenStatusIcon(SeenStatus status) {
  switch (status) {
    case SeenStatus.seen:
      return const Icon(
        Icons.done_all,
        color: AppColors.green,
      );
    case SeenStatus.delivered:
      return const Icon(
        Icons.done_rounded,
        color: AppColors.greyOverlay,
      );

    case SeenStatus.notSeen:
      return const Icon(
        Icons.done_rounded,
        color: AppColors.greyOverlay,
      );

    case SeenStatus.notSent:
      return const Icon(
        Icons.circle_outlined,
        color: AppColors.greyOverlay,
      );
  }
}
