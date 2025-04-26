import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/constants/strings/app_strings.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeServices {
  static pinCodeWidget(
      {Function? onChanged,
      int fieldCounts = 6,
      double fieldWidth = 45.0,
      required BuildContext context,
      required TextEditingController textEditingController,
      required StreamController<ErrorAnimationType> errorController}) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 19.h),
        child: PinCodeTextField(
          enablePinAutofill: true,
          keyboardType: TextInputType.number,
          cursorColor: const Color(0xff4E70DB),
          appContext: context,
          length: fieldCounts,
          hintCharacter: '.',
          hintStyle: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.bold,
              fontFamily: AppStrings.fontFamily,
              color: AppColors.secondaryLighter),
          obscureText: false,
          pastedTextStyle: TextStyle(
            color: AppColors.primary,
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            inactiveColor: AppColors.secondaryLighter,
            inactiveFillColor: Colors.transparent,
            // activeColor: Color(0xff4E70DB),
            activeColor: AppColors.primary,
            disabledColor: Colors.green,
            selectedFillColor: Colors.transparent,
            selectedColor: AppColors.primary,
            shape: PinCodeFieldShape.underline,
            borderRadius: BorderRadius.circular(12.r),
            fieldHeight: 60.h,
            fieldWidth: fieldWidth.w,
            activeFillColor: Colors.transparent,
          ),
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          enableActiveFill: true,
          errorAnimationController: errorController,
          controller: textEditingController,
          onCompleted: (v) {
            // debugPrint("Completed");
          },
          onChanged: (value) {
            // onChanged(value);
          },
          beforeTextPaste: (text) {
            // debugPrint("Allowing to paste $text");
            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
            //but you can show anything you want here, like your pop up saying wrong paste format or etc
            return true;
          },
        ),
      ),
    );
  }
}
