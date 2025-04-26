import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/services/network/request_status.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Core/utils/validator.dart';
import 'package:jumper/src/Features/shared/AuthFeature/Register/Logic/controller/register_controller.dart';
import 'package:jumper/src/Features/shared/AuthFeature/Register/Presentation/Widgets/have_account_before_widget.dart';
import 'package:jumper/src/Features/shared/AuthFeature/Register/Presentation/Widgets/privacy_policy_and_terms_widget.dart';
import 'package:jumper/src/Ui/TextFields/text_field_default.dart';
import 'package:jumper/src/Ui/appbars/default_appbar.dart';
import 'package:jumper/src/Ui/buttons/button_default.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

class RegisterScreen extends StatelessWidget {
  final int accType;

  const RegisterScreen({required this.accType, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    printDM("accType in register is $accType");
    var node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBars.basic(title: "create_acc"),
      body: GetBuilder<RegisterController>(
          init: RegisterController(),
          builder: (_) {
            return SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Form(
                        key: _.globalKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            35.5.ESH(),
                            const CustomText(
                              'Welcome_to_the_Jumper_platform',
                              fontWeight: FW.bold,
                              fontSize: 18,
                            ),
                            15.ESH(),
                            CustomText.light(
                              'Create_your_account_now_and_start_your_successful_career_with_us',
                            ),
                            34.ESH(),
                            TextFieldDefault(
                              isRequired: true,
                              prefixIconUrl:
                                  "assets/icons/TFPersonalNameIcon.png",
                              hint: "personal_name".tr,
                              keyboardType: TextInputType.name,
                              controller: _.nameController,
                              validation: (val) {
                                printDM("val is $val");
                                return AppValidator.validate(val,
                                    type: ValidatorType.userName);
                              },
                              onComplete: () {
                                node.nextFocus();
                              },
                            ),
                            24.ESH(),
                            TextFieldDefault(
                              isRequired: true,
                              prefixIconUrl: "assets/icons/TFEmailIcon.png",
                              hint: "email_".tr,
                              keyboardType: TextInputType.emailAddress,
                              controller: _.emailController,
                              validation: (val) => AppValidator.validate(val,
                                  type: ValidatorType.email),
                              onComplete: () {
                                node.nextFocus();
                              },
                            ),
                            24.ESH(),
                            TextFieldDefault(
                              isRequired: true,
                              prefixIconUrl: "assets/icons/TFPhoneIcon.png",
                              hint: "phone_number".tr,
                              suffixText: "+966",
                              keyboardType: TextInputType.phone,
                              controller: _.phoneController,
                              validation: (val) => AppValidator.validate(val,
                                  type: ValidatorType.phone),
                              maxLength: 10,
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
                            24.ESH(),
                            TextFieldDefault(
                              isRequired: true,
                              prefixIconUrl: "assets/icons/TFLockIcon.png",
                              hint: "confirm_password",
                              keyboardType: TextInputType.visiblePassword,
                              secureType: SecureType.toggle,
                              controller: _.confirmPasswordController,
                              validation: (val) {
                                if (_.passwordController!.text !=
                                    _.confirmPasswordController!.text) {
                                  return 'validate_confirm_password'.tr;
                                }
                                return null;
                              },
                              onComplete: () {
                                node.unfocus();
                                _.register(accType: accType);
                              },
                            ),
                            28.ESH(),
                            Center(
                              child: BottomRequestStatusBuilder(
                                status: _.dataState!,
                                bottomWidget: ButtonDefault(
                                  title: 'create_acc',
                                  onTap: () {
                                    node.unfocus();
                                    _.register(accType: accType);
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 8.h,
                          top: 20.h,
                        ),
                        child: Column(
                          children: [
                            HaveAccountBeforeWidget(onTap: () {
                              _.moveToLoginScreen();
                            }),
                            16.ESH(),
                            const PrivacyPolicyAndTermsWidget(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
