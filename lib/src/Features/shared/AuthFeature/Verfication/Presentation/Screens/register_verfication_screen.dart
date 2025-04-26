import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/services/network/request_status.dart';
import 'package:jumper/src/Core/services/pin_code.dart';
import 'package:jumper/src/Features/shared/AuthFeature/Verfication/Logic/controller/check_code_controller.dart';
import 'package:jumper/src/Features/shared/AuthFeature/Verfication/Presentation/Widgets/verification_top_widget.dart';
import 'package:jumper/src/Ui/buttons/button_default.dart';

import '../../../../../../Ui/buttons/custom_text_button.dart';
import '../../../Register/Logic/controller/register_controller.dart';
import '/src/core/utils/extensions.dart';

class RegisterVerificationScreen extends StatelessWidget {
  final String phone;
  final bool isEdit;
  final String? validationCode;
  final int accType;

  const RegisterVerificationScreen({
    Key? key,
    required this.phone,
    required this.accType,
    this.isEdit = false,
    this.validationCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);
    return Scaffold(
      body: GetBuilder<CheckCodeController>(
        init: CheckCodeController(),
        builder: (_) => SingleChildScrollView(
          child: Form(
            key: _.globalKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 55.h),
                  child: VerificationTopWidget(phone: phone),
                ),
                PinCodeServices.pinCodeWidget(
                  context: context,
                  textEditingController: _.textEditingController!,
                  errorController: _.errorController!,
                ),
                32.0.ESH(),
                BottomRequestStatusBuilder(
                  status: _.dataState!,
                  bottomWidget: ButtonDefault(
                    title: 'confirm',
                    onTap: () {
                      node.unfocus();
                      _.checkCode(phone: phone, isEdit: isEdit);
                    },
                  ),
                ),
                14.0.ESH(),
                
                UnconstrainedBox(
                  alignment: Alignment.centerRight,
                  child: GetBuilder<RegisterController>(
                    init: RegisterController(),
                    builder: (registerCtrl) {
                      return BottomRequestStatusBuilder(
                        status: registerCtrl.dataState!,
                        bottomWidget: CustomTextButton(
                          onPressed: () async{
                            _.textEditingController!.clear();
                            await registerCtrl.resendVerificationCode(
                              accType: accType
                            );
                            _.startResendCodeTimer();
                          },
                          isEnabled: _.resendCodeTimer == 0,
                          child: Text(_.resendCodeTimer == 0 ?
                            'resend_code'.tr
                            : "${'resend_code'.tr}: 00:${_.resendCodeTimer}"
                          ),
                        ),
                      );
                    }
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// void submit(BuildContext context) async {
//   if (verficationController.textEditingController!.text.length == 6) {
//     try {
//       await onSuccess!(
//           validationCode, verficationController.textEditingController!.text);
//     } catch (e) {
//       Get.back();
//       Get.back();
//       customSnackBar(
//         title: 'Error_'.tr,
//         subtitle: e.toString().contains(
//                 "The SMS verification code used to create the phone auth credential is invalid")
//             ? "confirm_code_and_resend".tr
//             : "confirm_code_and_resend".tr,
//       );
//       print(e);
//     }
//   }
// }
}
