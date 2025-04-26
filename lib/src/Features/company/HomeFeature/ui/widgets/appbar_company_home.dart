part of 'imports_widgets_home_screen.dart';

class CompanyHomeAppBar extends StatelessWidget  {
  const CompanyHomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DataBase dataBase = Get.find();
    return Builder(builder: (context) {
      final user = dataBase.restoreUserModel();
      return AppBars.basic(
        centerTitle: false,
        titleWidget: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConditionalBuilder(
              // condition: companyImage !="",
              condition: user.image != null && user.image != "",
              onBuild: CircleAvatar(
                radius: 18.r,
                backgroundColor: AppColors.transparent,
                backgroundImage: NetworkImage(
                  user.image,
                ),
              ),

              onFeedBack: CircleAvatar(
                radius: 18.r,
                backgroundColor: const Color(0xffCFCFD1),
                backgroundImage: const AssetImage(
                  Assets.default_company,
                ),
              ),
            ),
            XSpace.normal,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  "welcome".tr,
                  fontSize: 11,
                  fontWeight: FW.light,
                ),
                CustomText(
                  // "company".tr + " " + "$companyName",
                  "company".tr + " " + (user.name),
                  fontSize: 14,
                  fontWeight: FW.semiBold,
                  isOverFlow: true,
                ),
              ],
            ),
          ],
        ),
        actions: const [
          MessageBadge(),
          NotificationBadge(),
        ],
      );
    });
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
