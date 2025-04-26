part of 'import_widgets_j_home.dart';

class JumperHomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const JumperHomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DataBase dataBase = Get.find();
    final ChangeOffersController changeOffersController =
        Get.put(ChangeOffersController());
    return Builder(builder: (context) {
      final user = dataBase.restoreUserModel();
      return AppBars.basic(
        titleWidget: Row(
          // mainAxisSize: MainAxisSize.max,
          children: [
            ConditionalBuilder(
              // condition: companyImage !="",
              condition: user.image != null && user.image != "",
              onBuild: CircleAvatar(
                radius: 18.r,
                backgroundColor: AppColors.transparent,
                backgroundImage: NetworkImage(
                  // "$companyImage"??Assets.networkKDefaultUser,
                  user.image,
                ),
              ),

              onFeedBack: CircleAvatar(
                radius: 18.r,
                backgroundColor: const Color(0xffCFCFD1),
                backgroundImage: const AssetImage(
                  Assets.user,
                ),
              ),
            ),
            XSpace.normal,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    "welcome".tr,
                    fontSize: 11,
                    fontWeight: FW.light,
                  ),
                  CustomText(
                    // "company".tr + " " + "$companyName",
                    (user.name),
                    fontSize: 14,
                    fontWeight: FW.semiBold,
                    isOverFlow: true,
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          GetBuilder<JumperJobsController>(builder: (logic) {
            return GetBuilder<ChangeOffersController>(
                init: changeOffersController,
                builder: (_) {
                  return logic.dataState is! DataSuccess
                      ? 0.0.ESH()
                      : AdaptiveSwitch(
                          initialValue: (logic.dataState.data!.offersStatus),
                          toolTip: "show_hide_offers",
                          onChanged: () {
                            _.changeStatus(
                                initialValue:
                                    logic.dataState.data!.offersStatus);
                          },
                        );
                });
          }),
          const MessageBadge(),
          const NotificationBadge(),
        ],
      );
    });
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
