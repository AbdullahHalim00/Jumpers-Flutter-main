part of 'imports_widgets_company_base_screen.dart';

class CompanyBottomNavBar extends StatelessWidget {
  const CompanyBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompanyBaseController>(builder: (controller) {
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
            label: "employees".tr,
            activeImage: Assets.employee_enabled,
            disActiveImage: Assets.employee_disabled,
            notificationCount: 0,
          ),
          CustomBottomNavItem.defaultBottomNavItem(
            label: "more".tr,
            activeImage: Assets.menu_enabled,
            disActiveImage: Assets.menu_disabled,
            notificationCount: 0,
          ),
        ],
      );
    });
  }
}
