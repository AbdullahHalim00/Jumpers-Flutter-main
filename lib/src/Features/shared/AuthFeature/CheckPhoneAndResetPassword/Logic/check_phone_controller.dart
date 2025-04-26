import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/user_model.dart';
import 'package:jumper/src/Core/constants/decorations/app_durations.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CheckPhoneAndResetPassword/Data/params/check_phone_params.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CheckPhoneAndResetPassword/Data/repository/check_phone_repo.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CheckPhoneAndResetPassword/Presentation/Screens/reset_password_screen.dart';

class CheckPhoneController extends GetxController {
  TextEditingController? phoneController;

  final CheckPhoneRepository _checkEmailRepository = CheckPhoneRepository();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  DataState<UserModel>? dataState = const DataInitial();

  void checkPhone() async {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      dataState = const DataLoading();
      update();
      dataState = await _checkEmailRepository.checkPhone(
        params: CheckPhoneRequestParams(
          phone: phoneController!.text,
        ),
      );
      update();
      if (dataState is DataSuccess) {
        Get.to(
          ResetPasswordScreen(phone: phoneController!.text),
          transition: Transition.fade,
          duration: AppDurations.mainTransition,
        );
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    phoneController?.dispose();
    super.dispose();
  }
}
