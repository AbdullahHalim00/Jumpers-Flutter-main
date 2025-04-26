import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/utils.dart';
import 'package:jumper/src/Core/services/network/request_status.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Core/utils/validator.dart';
import 'package:jumper/src/Features/company/MoreFeatures/Logic/bloc/change_password_controller.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CheckPhoneAndResetPassword/Presentation/Widgets/reset_password_top_widget.dart';
import 'package:jumper/src/Ui/TextFields/text_field_default.dart';
import 'package:jumper/src/Ui/appbars/default_appbar.dart';
import 'package:jumper/src/Ui/buttons/button_default.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBars.basic(
        title: "new_password",
        isBack: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: GetBuilder<ChangePasswordController>(
          init: ChangePasswordController(),
          builder: (_) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: _.globalKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const ResetPasswordTopWidget(),
                    32.ESH(),
                    TextFieldDefault(
                      isRequired: true,
                      prefixIconUrl: "assets/icons/TFLockIcon.png",
                      hint: "old_password",
                      keyboardType: TextInputType.visiblePassword,
                      secureType: SecureType.toggle,
                      controller: _.oldPasswordController,
                      validation: (val) => AppValidator.validate(val,
                          type: ValidatorType.password),
                      onComplete: () {
                        node.nextFocus();
                      },
                    ),
                    24.ESH(),
                    TextFieldDefault(
                      isRequired: true,
                      prefixIconUrl: "assets/icons/TFLockIcon.png",
                      hint: "new_password",
                      keyboardType: TextInputType.visiblePassword,
                      secureType: SecureType.toggle,
                      controller: _.newPasswordController,
                      validation: (val) => AppValidator.validate(val,
                          type: ValidatorType.password),
                      onComplete: () {
                        node.unfocus();
                        // _.resetPassword(email: email);
                      },
                    ),
                    24.ESH(),
                    TextFieldDefault(
                      isRequired: true,
                      prefixIconUrl: "assets/icons/TFLockIcon.png",
                      hint: "confirm_password",
                      keyboardType: TextInputType.visiblePassword,
                      secureType: SecureType.toggle,
                      controller: _.confirmPasswordController,
                      validation: (val) {
                        if (_.newPasswordController!.text !=
                            _.confirmPasswordController!.text) {
                          return 'validate_confirm_password'.tr;
                        }
                        return null;
                      },
                      onComplete: () {
                        node.unfocus();
                        // _.resetPassword(email: email);
                      },
                    ),
                    28.ESH(),
                    BottomRequestStatusBuilder(
                      status: _.dataState!,
                      bottomWidget: ButtonDefault(
                        title: 'save',
                        onTap: () {
                          node.unfocus();
                          _.changePassword();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
