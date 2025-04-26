part of 'imports_widgets_jumper_onboarding.dart';

class JumperOnBoardingFooterButtons extends StatelessWidget {
  final JumperOnBoardingController controller;

  const JumperOnBoardingFooterButtons({required this.controller, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomRoundedButton(
          height: 54.h,
          backgroundColor: AppColors.secondary,
          child: CustomText(
            "have_acc_or_sign_in".tr,
            isUpperCase: true,
            color: Colors.white,
          ),
          onPressed: () {
            controller.moveToLogin();

            /// go to loginScreen
          },
        ),
        YSpace.hard,
        CustomOutlinedButton(
          height: 54.h,
          primaryColor: AppColors.secondary,
          isCurvedBorders: true,
          child: CustomText.subtitle(
            'new?_sign_up'.tr,
            fontSize: 16,
          ),
          onPressed: () {
            controller.moveToRegister();

            /// go to RegisterScreen
          },
        ),
      ],
    );
  }
}
