import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

class DefaultCheckBoxTile extends StatelessWidget {
  final String label;
  final bool isChecked;
  final void Function(bool?)? onChanged;

  const DefaultCheckBoxTile({
    Key? key,
    this.label = "",
    this.isChecked = false,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      bool initialValue = isChecked;
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(6.0.h),
            child: Theme(
              data: ThemeData(
                unselectedWidgetColor: Colors.grey,
              ),
              child: SizedBox(
                height: 20.h,
                width: 20.h,
                child: StatefulBuilder(builder: (context, setState) {
                  return Checkbox(
                    activeColor: AppColors.secondary,
                    value: initialValue,
                    onChanged: onChanged ??
                        (isCheckBox) {
                          setState(() {
                            initialValue = isCheckBox!;
                          });
                        },
                  );
                }),
              ),
            ),
          ),
          Expanded(
              child: CustomText(
            label,
            fontWeight: FW.regular,
            fontSize: 14,
          )),
        ],
      );
    });
  }
}
