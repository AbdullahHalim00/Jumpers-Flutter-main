part of 'empty_imports.dart';

class EmptyNotificationScreen extends StatelessWidget {
  const EmptyNotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: AppBars.basic(
        title: "notifications".tr,
        isBack: true,
      ),
      body: Center(
        child: EmptyPageBuilder(
          title: "no_notifications".tr,
          imageUrl: Assets.notification_2,
        ),
      ),
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
