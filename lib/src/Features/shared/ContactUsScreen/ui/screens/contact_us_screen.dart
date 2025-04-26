import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Features/shared/ContactUsScreen/bloc/controller/contact_us_controller.dart';

import '../../../../../Core/services/network/request_status.dart';
import '../../../../../Core/utils/utils.dart';
import '../../../../../Core/utils/validator.dart';
import '../../../../../Ui/TextFields/text_field_default.dart';
import '../../../../../Ui/buttons/button_default.dart';
import '../../../../../Ui/loading/loading_box.dart';
import '../widgets/contact_us_scaffold.dart';

class ContactUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);
    return ContactUsScaffold(
        body: GetBuilder<ContactUsController>(
            init: ContactUsController(),
            builder: (_) {
              return DataStatusBuilder(
                status: _.serviceDataState,
                onLoadingBuild: const LoadingBox(),
                onDoneBuild: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Form(
                      key: _.globalKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 100.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/TFEmailIcon.png',
                                        width: 25.w,
                                        height: 25.h,
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(_.serviceDataState.data == null
                                          ? ""
                                          : _.serviceDataState.data!.email ??
                                              ""),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: Container(
                                  height: 100.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/phone.png',
                                        width: 25.w,
                                        height: 25.h,
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(_.serviceDataState.data == null
                                          ? ""
                                          : _.serviceDataState.data!.phone ??
                                              ""),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
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
                            hint: "message".tr,
                            keyboardType: TextInputType.text,
                            controller: _.noteController,
                            validation: (val) => AppValidator.validate(val,
                                type: ValidatorType.message),
                            maxLines: 7,
                            onComplete: () {
                              node.nextFocus();
                            },
                          ),
                          35.ESH(),
                          Center(
                            child: BottomRequestStatusBuilder(
                              status: _.dataState!,
                              bottomWidget: ButtonDefault(
                                title: 'send'.tr,
                                onTap: () {
                                  node.unfocus();
                                  _.sendContactMessage();
                                },
                              ),
                            ),
                          ),
                          35.ESH(),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
