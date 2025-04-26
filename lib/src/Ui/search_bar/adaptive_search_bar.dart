import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Ui/buttons/custom_text_button.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

import '../../Core/services/app_data/app_data.dart';

/// Reviewed
double _borderRadius = 12.r;

double _borderWidth = 1;

Color _filledColor = AppColors.kCTFBackGround;
Color _enableBorder = AppColors.kCTFEnableBorder;
Color _disableBorder = AppColors.kCTFDisableBorder;
Color _focusBorder = AppColors.kCTFFocusBorder;

class AdaptiveSearchBar extends StatelessWidget {
  final String? hintLabel;

  final TextEditingController controller;
  final ValueChanged<String>? onSubmitted;
  final bool isFilled;

  final double? height;
  final EdgeInsets? padding;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;

  const AdaptiveSearchBar(
    this.controller, {
    Key? key,
    this.onSubmitted,
    this.hintLabel,
    this.isFilled = false,
    this.height,
    this.padding,
    this.onChanged,
    this.onClear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Widget _builtWidget;
    final isDark = Get.isDarkMode;
    switch (AppData.getOs()) {
      case 'android':
        _builtWidget = CupertinoSearchTextField(
          controller: controller,
          style: Theme.of(context).textTheme.subtitle2,
          itemColor: isDark ? Colors.white38 : Colors.black38,
          placeholder: hintLabel ?? 'search_anything'.tr,
          onSubmitted: onSubmitted,
          onChanged: onChanged,
        );
        break;
      default:
        _builtWidget = SizedBox(
          height: height ?? MediaQuery.of(context).size.height * 0.045,
          child: TextFormField(
            onChanged: onChanged,
            style: Theme.of(context).textTheme.subtitle2,
            controller: controller,
            onFieldSubmitted: onSubmitted,
            // onFieldSubmitted: onSubmitted,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 4.h),

              filled: isFilled,
              hintText: hintLabel ?? 'search_anything'.tr,
              hintStyle: TextStyle(
                color: isDark ? Colors.white38 : Colors.black38,
                fontSize: 14,
              ),
              fillColor: isDark ? Colors.white10 : _filledColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(_borderRadius),
                borderSide: BorderSide(
                  color: _enableBorder,
                  width: _borderWidth,
                  //style: BorderStyle.solid,
                ),
              ),

              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(_borderRadius),
                borderSide: BorderSide(
                  color: _disableBorder,
                  width: _borderWidth,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(_borderRadius),
                borderSide: BorderSide(
                  color: _enableBorder,
                  width: _borderWidth,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(_borderRadius),
                borderSide: BorderSide(
                  color: _focusBorder,
                  width: _borderWidth,
                ),
              ),

              // border:OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(10.0),
              //   borderSide: BorderSide.none,
              // ),

              prefixIcon: const Padding(
                padding: EdgeInsetsDirectional.only(),
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              suffix: CustomTextButton(
                child: CustomText.subtitle(
                  'clear'.tr,
                  isUpperCase: true,
                  color: AppColors.primary,
                ),
                onPressed: () {
                  controller.clear();
                  onClear!();
                },
              ),
            ),
          ),
        );
        break;
    }
    return Padding(
      padding: padding ??
          const EdgeInsetsDirectional.only(start: 8.0, end: 8.0, bottom: 8.0),
      child: SafeArea(
        child: _builtWidget,
      ),
    );
  }
}
