part of 'imports_widgets_service_details.dart';

class BuildJobApplicationAccepted extends StatelessWidget {
  final VoidCallback? onBackHomePressed;

  const BuildJobApplicationAccepted({Key? key, this.onBackHomePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.to(() => const JumperBaseScreen());
        return true;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomListView(
              children: [
                Image.asset(
                  Assets.applicationAccepted,
                  height: 151.h,
                  width: 151.h,
                ),
                16.0.ESH(),
                CustomText(
                  "app_req_accepted".tr,
                  fontSize: 18,
                  fontWeight: FW.semiBold,
                ),
                13.0.ESH(),
                CustomText.subtitle(
                  "explore_app_services".tr,
                  fontSize: 13,
                  fontWeight: FW.light,
                ),
                25.0.ESH(),
                GetBuilder<FetchAppFeaturesController>(
                    init: FetchAppFeaturesController(),
                    builder: (logic) {
                      return ListView.builder(
                          physics: AppPhysics.neverScrollable,
                          shrinkWrap: true,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            /// هاخد الليست من هنا
                            return const AppFeaturesListTile(
                              title: "طلبات الحضور والإنصراف",
                              image: Assets.account_info,
                              description:
                                  "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى",
                            );
                          });
                    }),
              ],
            ),
          ),
          32.0.ESH(),
          CustomRoundedButton(
            height: 54.h,
            backgroundColor: AppColors.secondary,
            child: CustomText(
              "back_to_home".tr,
              isUpperCase: true,
              color: Colors.white,
            ),
            onPressed: onBackHomePressed,
          ),
        ],
      ),
    );
  }
}
