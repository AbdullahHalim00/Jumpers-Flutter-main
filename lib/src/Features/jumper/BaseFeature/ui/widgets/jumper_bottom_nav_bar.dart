part of 'imports_widgets_jumper_base_screen.dart';

class JumperBottomNavBar extends StatelessWidget {
  const JumperBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final JumperBaseController controller = Get.find();
    return GetBuilder<JumperBaseController>(builder: (controller) {
      return BottomNavigationBar(
        onTap: controller.changeTabIndex,
        currentIndex: controller.tabIndex,
        items: [
          CustomBottomNavItem.defaultBottomNavItem(
            label: "HomeFeature".tr,
            activeImage: Assets.home_enabled,
            disActiveImage: Assets.home_disabled,
            notificationCount: 0,
          ),
          CustomBottomNavItem.defaultBottomNavItem(
            label: "jobs".tr,
            activeImage: Assets.jobs_enabled,
            disActiveImage: Assets.jobs_disabled,
            notificationCount: 0,
          ),
          CustomBottomNavItem.defaultBottomNavItem(
            label: "work".tr,
            activeImage: Assets.employee_enabled,
            disActiveImage: Assets.employee_disabled,
            notificationCount: 0,
          ),
          CustomBottomNavItem.defaultBottomNavItem(
            label: "account".tr,
            activeImage: Assets.account_enabled,
            disActiveImage: Assets.account_disabled,
            notificationCount: 0,
          ),
        ],
      );
    });
  }
}
