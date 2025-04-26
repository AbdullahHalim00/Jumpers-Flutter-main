part of 'empty_imports.dart';

class EmptyMessagesScreen extends StatelessWidget {
  const EmptyMessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyPageBuilder(
      title: "empty_messages".tr,
      imageUrl: Assets.empty_messages,
      body: "empty_messages_body".tr,
      // onRedirect: (){
      // //
      // },
      reverseRedirectChildrenOrder: true,
      redirectLabel: "message_management".tr,
      redirectImageUrl: Assets.chat,
    );
    // return DefaultScaffold(
    //
    //    appBarTitle: "notifications".tr,
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         CustomIconAvatar(
    //           imageUrl: Assets.notification_2,
    //           color: AppColors.transparent,
    //           radius: MediaQuery.of(context).size.height * 0.2,
    //         ),
    //         YSpace.titan,
    //         CustomText(
    //           "no_notifications".tr,
    //           isBold: true,
    //           fontSize: 18,
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
