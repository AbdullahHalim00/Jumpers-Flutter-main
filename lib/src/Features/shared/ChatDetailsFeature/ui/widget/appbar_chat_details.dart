part of 'imports_widgets_chat_details.dart';

class AppBarChatDetails extends StatelessWidget implements PreferredSizeWidget {
  const AppBarChatDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fetchMessagesController = Get.find<FetchMessagesController>();
    return AppBars.basic(
      toolbarHeight: 10,
      title: "messages".tr,
      isBack: true,
      centerTitle: false,
      titleWidget: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ImageNetwork(
                url: fetchMessagesController.chat.image,
                width: 50.h,
                height: 50.w,
                defaultAvatar: Assets.defaultUser,
              ),
            ),
            9.5.ESW(),
            CustomText(fetchMessagesController.chat.name ?? ""),
          ],
        ),
      ),
      actions: const [
        // ChatDetailsOptions(),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => AppBar().preferredSize;
}
