import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/user_model.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/company/MoreFeatures/Data/params/change_password_params.dart';
import 'package:jumper/src/Features/company/MoreFeatures/Data/repository/change_password_repo.dart';
import 'package:jumper/src/Ui/snackbar/app_snacks.dart';

class ChangePasswordController extends GetxController {
  TextEditingController? confirmPasswordController;
  TextEditingController? oldPasswordController;
  TextEditingController? newPasswordController;

  final ChangePasswordRepository _changePasswordRepository =
      Get.put(ChangePasswordRepository());

  GlobalKey<FormState> get globalKey => _globalKey;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  DataState<UserModel>? dataState = const DataInitial();

  bool get _isSameOldPassword {
    if ((oldPasswordController?.text == newPasswordController?.text) &&
        (newPasswordController?.text == confirmPasswordController?.text)) {
      return true;
    } else {
      return false;
    }
  }

  void changePassword() async {
    if (_globalKey.currentState!.validate()) {
      _globalKey.currentState!.save();

      if (_isSameOldPassword) {
        Utils.showToast(
          title: "new_password_same_as_old".tr,
          state: UtilState.Warning,
        );
      } else {
        dataState = const DataLoading();
        update();
        dataState = await _changePasswordRepository.changePassword(
          params: ChangePasswordRequestParams(
            oldPassword: oldPasswordController!.text,
            newPassword: newPasswordController!.text,
          ),
        );
        if (dataState is DataSuccess) {
          AppSnacks.successMessage(message: dataState!.message);
        } else {
          Get.back();
          AppSnacks.requestError(error: dataState!.message);
        }
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    confirmPasswordController = TextEditingController();
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    confirmPasswordController?.dispose();
    oldPasswordController?.dispose();
    newPasswordController?.dispose();
    super.dispose();
  }
}
