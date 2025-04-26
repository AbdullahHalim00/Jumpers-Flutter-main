import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/decorations/app_durations.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/company/OnboardingFeature/ui/screens/imports_company_onboarding.dart';
import 'package:jumper/src/Features/jumper/OnboardingFeature/ui/screens/imports_jumper_onboarding.dart';

class WelcomeController extends GetxController {
  int _index = 0;

  int get index => _index;

  void chooseApp(int newIndex) {
    _index = newIndex;
    update();
  }

  void onContinuePressed() {
    if (_index == 0) {
      printDM('JumperOnBoardingScreen');
      Get.to(
        () => const JumperOnBoardingScreen(),
        transition: Transition.fade,
        duration: AppDurations.mainTransition,
      );
    } else {
      printDM('CompanyOnBoardingScreen');
      Get.to(
        () => const CompanyOnBoardingScreen(),
        transition: Transition.fade,
        duration: AppDurations.mainTransition,
      );
    }
  }
}
