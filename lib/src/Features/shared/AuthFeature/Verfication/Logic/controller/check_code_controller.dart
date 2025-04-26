import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/user_model.dart';
import 'package:jumper/src/Core/constants/decorations/app_durations.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/utils/storage_util.dart';
import 'package:jumper/src/Features/company/base/ui/screens/imports_company_base_screen.dart';
import 'package:jumper/src/Features/jumper/BaseFeature/ui/screens/imports_jumper_base%20.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CheckPhoneAndResetPassword/Presentation/Screens/reset_password_screen.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CompanyInformation/Presentation/Screen/organisation_info_screen.dart';
import 'package:jumper/src/Features/shared/AuthFeature/JumperInformation/presentation/Ui/jumper_personal_info_screen.dart';
import 'package:jumper/src/Features/shared/AuthFeature/Verfication/Data/params/check_code_params.dart';
import 'package:jumper/src/Features/shared/AuthFeature/Verfication/Data/repository/check_code_repo.dart';
import 'package:jumper/src/Ui/snackbar/app_snacks.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CheckCodeController extends GetxController {
  TextEditingController? textEditingController;
  StreamController<ErrorAnimationType>? errorController;
  DataState<UserModel>? dataState = const DataInitial();
  final CheckCodeRepository _checkCodeRepository =
      Get.put(CheckCodeRepository());
  final DataBase _dataBase = Get.find();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  void checkCode(
      {required String phone,
      bool isReset = false,
      bool isEdit = false}) async {
    log("enter her 1");
    if (textEditingController!.text.length == 6) {
      dataState = const DataLoading();
      update();
      dataState = await _checkCodeRepository.checkCode(
          params: CheckCodeRequestParams(
        phone: phone,
        code: int.parse(textEditingController!.text.toString()),
      ));
      update();
      if (dataState is DataSuccess) {
        if (isEdit) {
          if (_dataBase.restoreUserModel().type == 0) {
            Get.to(
              () => const CompanyBaseScreen(),
              transition: Transition.fade,
              duration: AppDurations.mainTransition,
            );
          } else {
            Get.to(
              () => const JumperBaseScreen(),
              transition: Transition.fade,
              duration: AppDurations.mainTransition,
            );
          }
        } else if (isReset) {
          Get.to(
            ResetPasswordScreen(phone: phone),
            transition: Transition.fade,
            duration: AppDurations.mainTransition,
          );
        } else {
          if (_dataBase.restoreUserModel().type == 1) {
            Get.to(
              () => const JumperInfoScreen(),
              transition: Transition.fade,
              duration: AppDurations.mainTransition,
            );
          } else {
            Get.to(
              () => const OrganisationInfoScreen(),
              transition: Transition.fade,
              duration: AppDurations.mainTransition,
            );
          }
        }
      }
    } else {
      AppSnacks.requestError(error: 'short_code'.tr);
    }
  }

  int resendCodeTimer = 59;
  startResendCodeTimer(){
    if(resendCodeTimer != 59){
      resendCodeTimer = 59;
      update();
    }
    Timer.periodic(const Duration(seconds: 1), (timer) {
      resendCodeTimer -= 1;
      update();
      if(resendCodeTimer == 0) timer.cancel();
    });
  }

  void moveToLoginScreen() {
    Get.back();
    // Get.to(()=>RegisterScreen());
  }

  @override
  void onInit() {
    super.onInit();
    startResendCodeTimer();
    textEditingController = TextEditingController();
    errorController = StreamController<ErrorAnimationType>();
  }

  @override
  void dispose() {
    textEditingController?.dispose();
    errorController?.close();
    super.dispose();
  }
}
