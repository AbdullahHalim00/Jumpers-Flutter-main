part of 'imports_notifications.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsController());
    NotificationBadgeController countNumbersController = Get.find();
    // print(MediaQuery.of(context).size.height*0.06);
    return Scaffold(body: GetBuilder<NotificationsController>(builder: (_) {
      return ConditionalBuilder(
        // condition: _.notifications.isNotEmpty,
        condition: _.notifications.isNotEmpty,
        onBuild: _.dataState is! DataSuccess
            ? 0.ESH()
            : Scaffold(
                appBar: AppBars.basic(
                  title: "notifications".tr,
                  isBack: true,
                ),
                body: DataStatusBuilder(
                  status: _.dataState,
                  onDoneBuild: AndroidOnRefresh(
                    onRefresh: () async {
                      await _.fetchNotifications();
                    },
                    child: CustomListView(
                      children: _.notifications
                          .map(
                            (e) => NotificationItem(
                              onLongPress: () {
                                Get.dialog(Container());
                              },
                              isNew: true,
                              title: e.title,
                              imageUrl: e.image,
                              onPressed: () {},
                              createdAt: e.createdAt,
                              // onPressed: () {},
                              subtitle: e.text,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
        onFeedBack: const EmptyNotificationScreen(),
      );
    }));
  }
}
