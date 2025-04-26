import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/constants/decorations/app_durations.dart';
import 'package:jumper/src/Core/constants/decorations/app_physics.dart';
import 'package:jumper/src/Core/services/network/request_status.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Core/utils/storage_util.dart';
import 'package:jumper/src/Core/utils/validator.dart';
import 'package:jumper/src/Features/company/MoreFeatures/Logic/bloc/change_account_info_controller.dart';
import 'package:jumper/src/Features/company/MoreFeatures/ui/widgets/change_email_top_widget.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CheckPhoneAndResetPassword/Presentation/Screens/reset_password_screen.dart';
import 'package:jumper/src/Ui/TextFields/text_field_default.dart';
import 'package:jumper/src/Ui/appbars/default_appbar.dart';
import 'package:jumper/src/Ui/buttons/button_default.dart';
import 'package:jumper/src/Ui/buttons/custom_text_button.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

class ChangeEmailScreen extends StatelessWidget {
  const ChangeEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBars.basic(
        title: "email",
        isBack: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: GetBuilder<ChangeAccountInfoController>(
          // init: ChangeAccountInfoController(),
          builder: (_) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: _.globalKey2,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: AppPhysics.bouncingPhysics,
                      child: Column(
                        children: [
                          const ChangeEmailTopWidget(),
                          32.ESH(),
                          TextFieldDefault(
                            prefixIconUrl: "assets/icons/TFEmailIcon.png",
                            hint: "email_".tr,
                            keyboardType: TextInputType.emailAddress,
                            controller: _.newEmailController,
                            validation: (val) => AppValidator.validate(val,
                                type: ValidatorType.email),
                            onComplete: () {
                              node.nextFocus();
                            },
                          ),
                          24.ESH(),
                          TextFieldDefault(
                            isRequired: true,
                            prefixIconUrl: "assets/icons/TFLockIcon.png",
                            hint: "password",
                            keyboardType: TextInputType.visiblePassword,
                            secureType: SecureType.toggle,
                            controller: _.passwordController,
                            validation: (val) => AppValidator.validate(val,
                                type: ValidatorType.password),
                            onComplete: () {
                              node.nextFocus();
                            },
                          ),
                          28.ESH(),
                          BottomRequestStatusBuilder(
                            status: _.dataState!,
                            bottomWidget: ButtonDefault(
                              title: 'save',
                              onTap: () {
                                node.unfocus();
                                _.changeEmail();
                              },
                            ),
                          ),
                          28.ESH(),
                          CustomTextButton(
                            child: const CustomText(
                              "forget_password",
                              color: AppColors.primary,
                            ),
                            onPressed: () {
                              Get.to(
                                () => ResetPasswordScreen(
                                  phone: DataBase().restoreUserModel().phone,
                                ),
                                transition: Transition.fade,
                                duration: AppDurations.mainTransition,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
