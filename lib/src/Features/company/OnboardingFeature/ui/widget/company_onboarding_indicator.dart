part of 'imports_widgets_company_onboarding.dart';

class CompanyOnBoardingIndicator extends StatelessWidget {
  const CompanyOnBoardingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompanyOnBoardingController>(builder: (_) {
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
