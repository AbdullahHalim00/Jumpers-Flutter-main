import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/services/network/request_status.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Core/utils/validator.dart';
import 'package:jumper/src/Features/shared/AuthFeature/login/Bloc/controller/login_controller.dart';
import 'package:jumper/src/Ui/TextFields/text_field_default.dart';
import 'package:jumper/src/Ui/appbars/default_appbar.dart';
import 'package:jumper/src/Ui/buttons/button_default.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

class LoginScreen extends StatelessWidget {
  final int accType;

  const LoginScreen({required this.accType, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBars.basic(title: "login"),
      body: GetBuilder<LoginController>(
          init: LoginController(),
          builder: (_) {
            return SizedBox(
              width: double.infinity,
              child: Form(
                key: _.globalKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          35.5.ESH(),
                          const CustomText(
                            'welcome_back',
                            fontWeight: FW.bold,
                            fontSize: 18,
                          ),
                          15.ESH(),
                          CustomText.light(
                            'enter_your_personal_email_and_password',
                          ),
                          34.ESH(),
                          TextFieldDefault(
                            isRequired: true,
                            prefixIconUrl: "assets/icons/TFPhoneIcon.png",
                            hint: "phone_number".tr,
                            keyboardType: TextInputType.phone,
                            suffixText: "+966",
                            controller: _.phoneController,
                            // validation: (val) => AppValidator.validate(val,
                            //     type: ValidatorType.phone),
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
                            validation: (val) => AppValidator.validate(
                              val,
                              type: ValidatorType.password,
                            ),
                            onComplete: () {
                              node.unfocus();
                              _.login();
                            },
                          ),
                          28.ESH(),
                          ButtonDefault(
                            onTap: () => _.moveToResetPassword(),
                            title: 'forget_password',
                            titleColor: AppColors.titleBlack,
                            buttonColor: Colors.transparent,
                            width: 118,
                          ),
                          28.ESH(),
                          Center(
                            child: BottomRequestStatusBuilder(
                              status: _.dataState!,
                              bottomWidget: ButtonDefault(
                                title: 'login',
                                onTap: () {
                                  node.unfocus();
                                  _.login();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 8.h,
                        ),
                        child: ButtonDefault(
                          height: 48,
                          width: 240,
                          buttonColor: Colors.transparent,
                          onTap: () {
                            _.moveToRegister(accType: accType);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              CustomText("don't_have_account",
                                  fontWeight: FW.light),
                              CustomText(
                                "create_acc",
                                fontWeight: FW.semiBold,
                                color: AppColors.titleGreen,
                              )
                            ],
                          ),
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
