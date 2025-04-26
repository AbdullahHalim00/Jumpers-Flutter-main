import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:jumper/src/Core/utils/extensions.dart';

import '../../../../../Core/constants/colors/app_colors.dart';
import '../../../../../Core/services/network/request_status.dart';
import '../../../../../Core/utils/validator.dart';
import '../../../../../Ui/TextFields/text_field_default.dart';
import '../../../../../Ui/buttons/button_default.dart';
import '../../Logic/bloc/change_account_info_controller.dart';

class MoreInfoScreen extends StatelessWidget {
  const MoreInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBars.basic(
        title: 'account_info',
        isBack: true,
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: GetBuilder<ChangeAccountInfoController>(
          init: ChangeAccountInfoController(),
          builder: (_) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: Form(
                key: _.globalKey,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextFieldDefault(
                              prefixIconUrl:
                              "assets/icons/TFPersonalNameIcon.png",
                              hint: "personal_name".tr,
                              keyboardType: TextInputType.name,
                              controller: _.nameController,
                              fieldType: FieldType.withOutBorder,
                              validation: (val) => AppValidator.validate(val,
                                  type: ValidatorType.userName),
                              onComplete: () {
                                node.nextFocus();
                              },
                            ),
                            // 24.ESH(),
                            // TextFieldDefault(
                            //   prefixIconUrl: "assets/icons/TFPhoneIcon.png",
                            //   hint: "phone_number".tr,
                            //   keyboardType: TextInputType.phone,
                            //   controller: _.phoneController,
                            //   fieldType: FieldType.WithOutBorder,
                            //   validation: (val) =>
                            //       AppValidator.validate(val, type: ValidatorType.phone),
                            //   onComplete: () {
                            //     node.nextFocus();
                            //   },
                            // ),
                            24.ESH(),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                TextFieldDefault(
                                  enable: false,
                                  prefixIconUrl: "assets/icons/TFEmailIcon.png",
                                  hint: "email_".tr,
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _.emailController,
                                  fieldType: FieldType.withOutBorder,
                                  validation: (val) =>
                                      AppValidator.validate(val, type: ValidatorType.email),
                                  onComplete: () {
                                    node.nextFocus();
                                  },
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: InkWell(
                                    onTap: () {
                                      _.moveToChangeEmailScreen();
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.secondary),
                                      height: 26.w,
                                      width: 26.w,
                                      child: Center(
                                        child: ImageIcon(
                                            const AssetImage("assets/icons/edit_2.png"),
                                            color: Colors.white,
                                            size: 14.w),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            40.ESH(),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: BottomRequestStatusBuilder(
                        status: _.dataState!,
                        bottomWidget: ButtonDefault(
                          title: 'save',
                          active: _.activeButton,
                          onTap: () {
                            node.unfocus();
                            _.changeAccountInfo();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AppBars {
  static PreferredSizeWidget basic({
    required String title,
    required bool isBack,
  }) {
    return AppBar(
      title: Text(title),
      leading: isBack ? BackButton() : null,
    );
  }
}
