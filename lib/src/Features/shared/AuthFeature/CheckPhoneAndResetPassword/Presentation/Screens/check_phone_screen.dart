import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:jumper/src/Core/services/network/request_status.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Core/utils/validator.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CheckPhoneAndResetPassword/Logic/check_phone_controller.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CheckPhoneAndResetPassword/Presentation/Widgets/check_Phone_top_widget.dart';
import 'package:jumper/src/Ui/TextFields/text_field_default.dart';
import 'package:jumper/src/Ui/appbars/default_appbar.dart';
import 'package:jumper/src/Ui/buttons/button_default.dart';

class CheckPhoneScreen extends StatelessWidget {
  const CheckPhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBars.basic(
        title: "reset_password",
        isBack: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: GetBuilder<CheckPhoneController>(
          init: CheckPhoneController(),
          builder: (_) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                const CheckPhoneTopWidget(),
                32.ESH(),
                Form(
                  key: _.globalKey,
                  child: TextFieldDefault(
                    isRequired: true,
                    prefixIconUrl: "assets/icons/TFPhoneIcon.png",
                    hint: "phone_number",
                    keyboardType: TextInputType.phone,
                    suffixText: "+966",
                    controller: _.phoneController,
                    validation: (val) =>
                        AppValidator.validate(val, type: ValidatorType.phone),
                    onComplete: () {
                      node.nextFocus();
                    },
                  ),
                ),
                24.ESH(),
                BottomRequestStatusBuilder(
                  status: _.dataState!,
                  bottomWidget: ButtonDefault(
                    title: 'send_code',
                    onTap: () {
                      node.unfocus();
                      _.checkPhone();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
