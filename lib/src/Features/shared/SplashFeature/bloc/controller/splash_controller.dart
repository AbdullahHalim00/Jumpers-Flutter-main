import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jumper/src/Core/constants/decorations/app_durations.dart';
import 'package:jumper/src/Core/services/app_data/app_data.dart';
import 'package:jumper/src/Core/utils/storage_util.dart';
import 'package:jumper/src/Features/company/base/ui/screens/imports_company_base_screen.dart';
import 'package:jumper/src/Features/jumper/BaseFeature/ui/screens/imports_jumper_base%20.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final Duration _splashDuration = const Duration(milliseconds: 4500);
  final Curve _animationCurve = Curves.easeInOutBack;

  late AnimationController _controller;
  late Animation _animation;

  Animation get animation => _animation;
  final GetStorage _box = GetStorage();
  final DataBase _dataBase = Get.find();

  @override
  void onInit() {
    super.onInit();
    // call trigger SplashFeature method
    // _triggerSplash();
    // define my animation like :
    _controller = AnimationController(vsync: this, duration: _splashDuration);
    _animation = CurvedAnimation(parent: _controller, curve: _animationCurve);
    // animate
    _controller.forward();
    _controller.addListener(() {
      update();
      if (_animation.isCompleted) {
        if (_box.read('login') == true) {
          if (_dataBase.restoreUserModel().type == 0) {
            Get.offAll(
              () => const CompanyBaseScreen(),
              transition: Transition.fade,
              duration: AppDurations.mainTransition,
            );
          } else {
            Get.offAll(
              () => const JumperBaseScreen(),
              transition: Transition.fade,
              duration: AppDurations.mainTransition,
            );
          }
        } else {
          AppData.controlFlow();
        }
      } else {
        // debugPrint('animation => isDismissed');
      }
    });
  }
}
