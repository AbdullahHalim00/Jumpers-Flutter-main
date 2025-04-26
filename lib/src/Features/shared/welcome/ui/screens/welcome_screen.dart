part of 'imports_welcome.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(WelcomeController());
    return Scaffold(
      backgroundColor: AppColors.scafBCGBasic,
      appBar: AppBars.logo(),
      body: Padding(
        padding: AppInsets.defaultScreenALL,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomIconAvatar(
                    radius: 40.r,
                    color: AppColors.containerBCGGrey.withOpacity(.9),
                    customChild: LottieBuilder.asset(
                      Assets.lottie_wave,
                    ),
                  ),
                  YSpace.light,
                  CustomText.subtitle(
                    "welcome_back".tr,
                    fontSize: 14,
                    fontWeight: FW.light,
                  ),
                  YSpace.normal,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 42.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          "first_tell_us".tr,
                          fontSize: 22,
                          isBold: true,
                        ),
                        CustomText(
                          "who_are_you".tr,
                          fontSize: 22,
                          isBold: true,
                          color: AppColors.primary,
                        ),
                        CustomText(
                          "?".tr,
                          fontSize: 22,
                          isBold: true,
                        ),
                      ],
                    ),
                  ),
                  YSpace.hard,
                  CustomText.subtitle(
                    "welcome_body".tr,
                    fontSize: 12,
                    fontWeight: FW.regular,
                    padding: EdgeInsets.symmetric(horizontal: 42.0.w),
                  ),
                  YSpace.hard,

                  /// card builder

                  GetBuilder<WelcomeController>(builder: (_) {
                    return Row(
                      children: [
                        Expanded(
                          child: SelectAppCard(
                            label: "searching_for_jobs".tr,
                            description: "searching_for_jobs_description".tr,
                            iconUrl: Assets.briefcase_enableed,
                            isSelected: _.index == 0,
                            onSelect: () => _.chooseApp(0),
                          ),
                        ),
                        Expanded(
                          child: SelectAppCard(
                            label: "searching_for_employees".tr,
                            description:
                                "searching_for_employees_description".tr,
                            iconUrl: Assets.user_enabled,
                            isSelected: _.index == 1,
                            onSelect: () => _.chooseApp(1),
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
            GetBuilder<WelcomeController>(builder: (logic) {
              return CustomRoundedButton(
                height: 54.h,
                backgroundColor: AppColors.secondary,
                child: CustomText.subtitle(
                  'continue'.tr,
                  fontSize: 16,
                  color: AppColors.white,
                ),
                onPressed: () {
                  logic.onContinuePressed();
                },
              );
            }),

            ///
          ],
        ),
      ),
    );
  }
}
