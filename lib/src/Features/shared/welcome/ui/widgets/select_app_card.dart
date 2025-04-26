import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Ui/cards/picker_card.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

class SelectAppCard extends StatelessWidget {
  final String label;

  final String description;

  final String iconUrl;

  final bool isSelected;
  final VoidCallback? onSelect;

  const SelectAppCard({
    Key? key,
    this.isSelected = false,
    this.onSelect,
    required this.label,
    required this.description,
    required this.iconUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PickerCard(
      // padding: EdgeInsets.symmetric(horizontal: 17.3.w, vertical: 23.h),
      isSelected: isSelected,
      onPressed: onSelect,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 37.r,
            backgroundColor:
                isSelected ? AppColors.primary : AppColors.cardBorderDarker,
            child: Image.asset(iconUrl),
          ),
          21.1.ESH(),
          CustomText(label, fontSize: 14, fontWeight: FW.semiBold),
          7.1.ESH(),
          CustomText.subtitle(description,
              fontSize: 10,
              fontWeight: FW.light,
              padding: EdgeInsets.symmetric(horizontal: 15.w)),
        ],
      ),
    );
  }
}
