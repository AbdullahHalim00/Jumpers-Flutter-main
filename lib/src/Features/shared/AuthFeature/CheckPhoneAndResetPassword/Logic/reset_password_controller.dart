import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/user_model.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CheckPhoneAndResetPassword/Data/params/reset_password_params.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CheckPhoneAndResetPassword/Data/repository/reset_password_repo.dart';

class ResetPasswordController extends GetxController {
  TextEditingController? confirmPasswordController;
  TextEditingController? passwordController;

  final ResetPasswordRepository _resetPasswordRepository =
      Get.put(ResetPasswordRepository());
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  DataState<UserModel>? dataState = const DataInitial();

  void resetPassword({required String email}) async {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      update();
      dataState = await _resetPasswordRepository.resetPassword(
        params: ResetPasswordRequestParams(
            email: email, password: passwordController!.text),
      );
      if (dataState is DataSuccess) {}
    }
  }

  @override
  void onInit() {
    super.onInit();
    confirmPasswordController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    confirmPasswordController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }
}
