part of "imports_widgets_jumper_onboarding.dart";

class JumperOnBoardingIndicator extends StatelessWidget {
  const JumperOnBoardingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JumperOnBoardingController>(builder: (_) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 23.0.h),
        child: SmoothPageIndicator(
          controller: _.pageController,
          count: _.data.length,
          effect: JumpingDotEffect(
            activeDotColor: AppColors.primary,
            dotColor: AppColors.primLighter,
            dotHeight: 8.h,
            dotWidth: 8.h,
          ),
          onDotClicked: _.onPageChanged,
        ),
      );
    });
  }
}
