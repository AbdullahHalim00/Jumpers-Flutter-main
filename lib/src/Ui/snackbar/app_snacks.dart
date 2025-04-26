import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../Core/utils/utils.dart';

abstract class AppSnacks {
  static void _showUtil(bool isToast,
      {required String title, required UtilState state}) {
    if (isToast) {
      Utils.showDefaultSnackBar(title: title, state: state);
    } else {
      Utils.showToast(title: title, state: state);
    }
  }

  static void connectionError({bool isToast = false}) => _showUtil(
        isToast,
        state: UtilState.Warning,
        title: "check_ur_connection".tr,
      );

  static void requestError({String? error, bool isToast = false}) => _showUtil(
        isToast,
        state: UtilState.Error,
        title: error ?? "something_went_wrong".tr,
      );

  static void successMessage({String? message, bool isToast = false}) =>
      _showUtil(
        isToast,
        state: UtilState.Success,
        title: message ?? "Success".tr,
      );

  static void errorMessage({bool isToast = false}) => _showUtil(
        isToast,
        state: UtilState.Error,
        title: "something_went_wrong_details".tr,
      );

  static void loginSuccess({bool isToast = false}) => _showUtil(
        isToast,
        state: UtilState.Success,
        title: "confirm_code_sub_title".tr,
      );

  static void resendVerifyCodeSuccess({bool isToast = false}) => _showUtil(
        isToast,
        state: UtilState.Success,
        title: "resend_verify_code_success".tr,
      );

  static void logoutSuccess({bool isToast = false}) => _showUtil(
        isToast,
        state: UtilState.Success,
        title: "logout_success".tr,
      );

  static void shortPassword({bool isToast = false}) => _showUtil(
        isToast,
        state: UtilState.Warning,
        title: "short_password".tr,
      );

  static void notMatchedPasswords({bool isToast = false}) => _showUtil(
        isToast,
        state: UtilState.Warning,
        title: "validate_confirm_password".tr,
      );

  static void invalidNumber({bool isToast = false}) => _showUtil(
        isToast,
        state: UtilState.Warning,
        title: "try_with_valid_num".tr,
      );

  static void passwordChangedSuccess({bool isToast = false}) => _showUtil(
        isToast,
        state: UtilState.Success,
        title: "password_changed_successfully".tr,
      );

  static void notifyStatusChangedSuccess({bool isToast = false}) => _showUtil(
        isToast,
        state: UtilState.Success,
        title: "notify_status_successfully".tr,
      );

  static void phoneVerifySuccess({bool isToast = false}) => _showUtil(
        isToast,
        state: UtilState.Success,
        title: "phone_verified_successfully".tr,
      );

  static void messageSentSuccess({bool isToast = false}) => _showUtil(
        isToast,
        state: UtilState.Success,
        title: "message_sent_successfully".tr,
      );

  static void usernameChangedSuccess({bool isToast = false}) => _showUtil(
        isToast,
        state: UtilState.Success,
        title: "username_changed_successfully".tr,
      );

  static void birthdayChangedSuccess({bool isToast = false}) => _showUtil(
        isToast,
        state: UtilState.Success,
        title: "birthday_changed_successfully".tr,
      );

  static void personalImageChangedSuccess({bool isToast = false}) => _showUtil(
        isToast,
        state: UtilState.Success,
        title: "personalImage_changed_successfully".tr,
      );

  static void acceptEmployee({bool isToast = false}) => _showUtil(
        isToast,
        state: UtilState.Success,
        title: "employee_accepted".tr,
      );

  static void rejectEmployee({bool isToast = false}) => _showUtil(
        isToast,
        state: UtilState.Success,
        title: "employee_rejected".tr,
      );

  static void returnEmployee({bool isToast = false}) => _showUtil(
        isToast,
        state: UtilState.Success,
        title: "تم الاسترجاع للمرشحين ".tr,
      );

  static void changeFav({bool isToast = false}) => _showUtil(
        isToast,
        state: UtilState.Success,
        title: "تم بنجاح".tr,
      );

  static void firedSuccessfully({bool isToast = false}) => _showUtil(
        isToast,
        state: UtilState.Success,
        title: "هذا الموظف لم يعد متاح لهذه الوظيفة ".tr,
      );
}
