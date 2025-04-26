import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

class SingleChoiceRowForm extends StatelessWidget {
  final String title;
  final bool isSelected;

  const SingleChoiceRowForm({
    required this.title,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: CustomText(
              title,
              isOverFlow: true,
              fontWeight: FW.medium,
            ),
            //192.168.0.105
            //192.168.0.105:5555
          ),
          Container(
            height: 24.w,
            width: 24.w,
            decoration: BoxDecoration(
              color: isSelected == false
                  ? Colors.transparent
                  : AppColors.secondary,
              shape: BoxShape.circle,
              border: Border.all(
                  width: 2.w,
                  color: isSelected != false
                      ? Colors.transparent
                      : AppColors.borderSingleChose),
            ),
            child: isSelected == false
                ? 0.0.ESH()
                : Center(
                    child: Container(
                      height: 10.w,
                      width: 10.w,
                      decoration: BoxDecoration(
                          color: isSelected != false
                              ? AppColors.white
                              : AppColors.secondary,
                          shape: BoxShape.circle),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}

class MultiChoiceRowForm extends StatelessWidget {
  final String title;
  final bool isSelected;

  const MultiChoiceRowForm({
    required this.title,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: CustomText(
              title,
              isOverFlow: true,
              fontWeight: FW.medium,
            ),
          ),
          Container(
            height: 24.h,
            width: 24.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected == false
                  ? Colors.transparent
                  : AppColors.secondary,
              // borderRadius: BorderRadius.circular(6.r),
              border: Border.all(
                  width: 2.w,
                  color: isSelected != false
                      ? Colors.transparent
                      : AppColors.borderSingleChose),
            ),
            child: isSelected == false
                ? 0.0.ESH()
                : Icon(
                    Icons.check,
                    size: 14.w,
                    color: Colors.white,
                  ),
          )
        ],
      ),
    );
  }
}
