import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:jumper/src/Bloc/models/onboarding_model.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';

class OnBoardingJumperData {
  OnBoardingJumperData._();

  static final List<OnBoardingModel> _jumperList = [
    OnBoardingModel(
      title: 'onBoarding_title_4'.tr,
      body: 'onBoarding_body_4'.tr,
      imageUrl: Assets.onboardingJumper1,
    ),
    OnBoardingModel(
      title: 'onBoarding_title_5'.tr,
      body: 'onBoarding_body_5'.tr,
      imageUrl: Assets.onboardingJumper2,
    ),
    OnBoardingModel(
      title: 'onBoarding_title_6'.tr,
      body: 'onBoarding_body_6'.tr,
      imageUrl: Assets.onboardingJumper3,
    ),
  ];

  static List<OnBoardingModel> get jumperList => _jumperList;
}
