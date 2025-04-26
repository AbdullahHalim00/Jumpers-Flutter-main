import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';
import 'package:jumper/src/Ui/circle_avatar/custom_icon_avatar.dart';
import 'package:jumper/src/Ui/spaces_and_dividers/custom_divider.dart';

import '../../Core/constants/colors/app_colors.dart';
import '../buttons/custom_icon_button.dart';
import '../text/custom_text.dart';

class AdaptivePicker {
  static datePicker({
    required BuildContext context,
    required Function(DateTime? date) onConfirm,
    required String title,
    DateTime? initial,
    DateTime? minDate,
  }) async {
    if (Platform.isIOS) {
      _iosDatePicker(context, onConfirm, title,
          initial: initial, minDate: minDate);
    } else {
      _androidDatePicker(context, onConfirm,
          initial: initial, minDate: minDate);
    }
  }

  static _androidDatePicker(
      BuildContext context, Function(DateTime? date) onConfirm,
      {DateTime? initial, DateTime? minDate}) {
    showRoundedDatePicker(
        context: context,
        initialDate: initial ?? DateTime.now(),
        firstDate: minDate ?? DateTime.now().add(const Duration(days: -1)),
        lastDate: DateTime(2050),
        borderRadius: 16,
        height: 300,
        styleDatePicker: MaterialRoundedDatePickerStyle(),
        theme: ThemeData.light().copyWith(
          primaryColor: AppColors.primary,
          hintColor: Colors.black,
          backgroundColor: AppColors.white,
          buttonTheme:
              const ButtonThemeData(textTheme: ButtonTextTheme.primary),
        )).then(onConfirm);
  }

  static _iosDatePicker(
      BuildContext context, Function(DateTime? date) onConfirm, String title,
      {DateTime? initial, DateTime? minDate}) {
    _bottomSheet(
      context: context,
      child: cupertinoDatePicker(context,
          initial: initial,
          minDate: minDate,
          title: title,
          onConfirm: onConfirm),
    );
  }

  static Widget cupertinoDatePicker(
    BuildContext context, {
    required String title,
    String? onConfirmLabel,
    required Function(DateTime? date) onConfirm,
    DateTime? initial,
    DateTime? minDate,
    DateTime? maxDate,
    int? maximumYear,
    int minimumYear = 1,
  }) {
    DateTime _date = DateTime.now();
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      color: AppColors.mainPrimBCGLight,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.black,
                  ),
                ),
                CustomText(
                  title,
                  color: AppColors.black,
                  fontSize: 16,
                  isBold: true,
                ),
                ElevatedButton(
                  onPressed: () {
                    log("Hello");
                    onConfirm(_date);
                    Navigator.of(context).pop();
                  },
                  child: CustomText(
                    onConfirmLabel ?? "done",
                    fontSize: 14,
                    color: AppColors.primary,
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: AppColors.mainPrimBCGLight,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: CupertinoDatePicker(
              backgroundColor: AppColors.mainPrimBCGLight,
              initialDateTime: initial ?? DateTime.now(),
              onDateTimeChanged: (date) {
                _date = date;
                debugPrint("date is => $_date");
              },
              minimumDate:
                  minDate ?? DateTime.now().add(const Duration(days: -1)),
              mode: CupertinoDatePickerMode.date,
              maximumDate: maxDate,
              minimumYear: minimumYear,
              maximumYear: maximumYear,
            ),
          ),
        ],
      ),
    );
  }

  static timePicker(
      {required BuildContext context,
      required String title,
      required DateTime initial,
      required Function(DateTime? date) onConfirm}) async {
    if (Platform.isIOS) {
      _iosTimePicker(context, title, onConfirm, initial);
    } else {
      _androidTimePicker(context, onConfirm);
    }
  }

  static _androidTimePicker(
      BuildContext context, Function(DateTime date) onConfirm) {
    var now = DateTime.now();
    showRoundedTimePicker(
      context: context,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        hintColor: Colors.black,
        backgroundColor: AppColors.white,
        buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
      ),
      initialTime: TimeOfDay.now(),
    ).then((time) => onConfirm(
        DateTime(now.year, now.month, now.day, time!.hour, time.minute)));
  }

  static _iosTimePicker(BuildContext context, String title,
      Function(DateTime? date) onConfirm, DateTime initial) {
    _bottomSheet(
      context: context,
      child: cupertinoTimePicker(context, title,
          onConfirm: onConfirm, initial: initial),
    );
  }

  static Widget cupertinoTimePicker(BuildContext context, String title,
      {required Function(DateTime? date) onConfirm,
      required DateTime initial}) {
    DateTime _date = DateTime.now();
    return Container(
      color: AppColors.containerBCGWhite,
      height: 260.h,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconAvatar(
                  imageUrl: Assets.close,
                  onTap: () => Navigator.pop(context),
                ),
                CustomText(
                  title,
                  fontWeight: FW.semiBold,
                  padding: const EdgeInsetsDirectional.only(end: 0.0),
                ),
                ElevatedButton(
                  onPressed: () {
                    onConfirm(_date);
                    Navigator.of(context).pop();
                  },
                  child: CustomText(
                    "done".tr,
                    fontSize: 14,
                    color: AppColors.primary,
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 0, primary: AppColors.white),
                ),
              ],
            ),
          ),
          XDivider.normal(verticalPadding: 5.0.h),
          Flexible(
              child: CupertinoDatePicker(
            initialDateTime: initial,
            onDateTimeChanged: (date) {
              _date = date;
            },
            mode: CupertinoDatePickerMode.time,
          )),
        ],
      ),
    );
  }

  static _bottomSheet({required BuildContext context, required Widget child}) {
    return showModalBottomSheet(
      isScrollControlled: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(13),
          topRight: Radius.circular(13),
        ),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => SizedBox(
        height: 320,
        child: child,
      ),
    );
  }
}
