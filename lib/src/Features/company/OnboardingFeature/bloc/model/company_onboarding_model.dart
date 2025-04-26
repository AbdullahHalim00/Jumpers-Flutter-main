import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:jumper/src/Bloc/models/onboarding_model.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';

class OnBoardingCompanyData {
  OnBoardingCompanyData._();

  static final List<OnBoardingModel> _onBoardingList = [
    OnBoardingModel(
      title: 'onBoarding_title_1'.tr,
      body: 'onBoarding_body_1'.tr,
      imageUrl: Assets.onboardingCompany1,
    ),
    OnBoardingModel(
      title: 'onBoarding_title_2'.tr,
      body: 'onBoarding_body_2'.tr,
      imageUrl: Assets.onboardingCompany2,
    ),
    OnBoardingModel(
      title: 'onBoarding_title_3'.tr,
      body: 'onBoarding_body_3'.tr,
      imageUrl: Assets.onboardingCompany3,
    ),
  ];

  static List<OnBoardingModel> get companyList => _onBoardingList;
}
