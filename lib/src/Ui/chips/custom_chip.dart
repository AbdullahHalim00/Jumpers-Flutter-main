import 'package:flutter/material.dart';

import '../../Core/constants/colors/app_colors.dart';
import '../text/custom_text.dart';

class CustomChip extends StatelessWidget {
  final String? label;
  final VoidCallback? onDeleted;

  const CustomChip({
    Key? key,
    this.label,
    this.onDeleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
      child: Chip(
        onDeleted: onDeleted,
        label: CustomText.subtitle(
          "$label",
          fontSize: 10,
          fontWeight: FW.regular,
          color: AppColors.primary,
        ),
        backgroundColor: AppColors.chipsInner,
        elevation: 1,
        deleteIcon: const Icon(Icons.remove),
        side: const BorderSide(
          color: AppColors.chipsBorder,
        ),
      ),
    );
  }
}
