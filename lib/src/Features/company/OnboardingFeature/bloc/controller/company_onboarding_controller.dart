import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jumper/src/Bloc/models/onboarding_model.dart';
import 'package:jumper/src/Core/services/storage/storage_constants.dart';
import 'package:jumper/src/Features/company/OnboardingFeature/bloc/model/company_onboarding_model.dart';
import 'package:jumper/src/Features/shared/AuthFeature/Register/Presentation/Screens/register_screen.dart';
import 'package:jumper/src/Features/shared/AuthFeature/login/Presentation/Screens/login_screen.dart';

class CompanyOnBoardingController extends GetxController {
  PageController pageController = PageController();
  List<OnBoardingModel> data = OnBoardingCompanyData.companyList;
  bool isLastPage = false;

  int currentIndex = 0;

  void _saveOnBoardingDone() {
    GetStorage _box = GetStorage();
    _box
        .write(
      stgOnBoarding,
      true,
    )
        .then((_) {
      // Future.delayed(const Duration(seconds: 1),() {
      //   return  Get.offAll(()=>const CompanyBaseScreen());
      // },);
      // Get.offAll(() => const LoginScreen(accType: 0,),
      //   transition: Transition.fade,
      //   duration: const Duration(milliseconds: 400),
      // );
    });
  }

  void moveToLogin() {
    Get.offAll(
      () => const LoginScreen(
        accType: 0,
      ),
      transition: Transition.fade,
      duration: const Duration(milliseconds: 400),
    );
  }

  void moveToRegister() {
    Get.to(
      () => const RegisterScreen(
        accType: 0,
      ),
      transition: Transition.fade,
      duration: const Duration(milliseconds: 400),
    );
  }

  void onNextChanged() {
    if (isLastPage) {
      /// todo
      _saveOnBoardingDone();
    } else {
      pageController.nextPage(
        duration: const Duration(microseconds: 750),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    }
    update();
  }

  void onSkip() {
    /// todo
    // box.write //
    isLastPage = true;
    update();
    _saveOnBoardingDone();
  }

  // void onPreviousChanged() {
  //   pageController.previousPage(
  //       duration: Duration(seconds: 1), curve: Curves.fastLinearToSlowEaseIn);
  //   update();
  // }

  void onPageChanged(int index) {
    currentIndex = index;
    isLastPage = (index == data.length - 1);
    if (isLastPage) {
      _saveOnBoardingDone();
    } else {}
    update();
  }
}
