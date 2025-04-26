import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/constants/colors/app_colors.dart';
import '../builders/conditional_builder.dart';
import '../buttons/custom_icon_button.dart';
import '../buttons/custom_text_button.dart';
import '../spaces_and_dividers/custom_divider.dart';
import '../text/custom_text.dart';

class BottomSheetActionTile extends StatelessWidget {
  final String label;

  final String? actionLabel;

  final bool isMainIconDisabled;

  final VoidCallback? onMainPressed;

  const BottomSheetActionTile({
    Key? key,
    required this.label,
    this.actionLabel,
    this.onMainPressed,
    this.isMainIconDisabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.close,
              ),
            ),
            CustomText(
              label,
            ),
            ConditionalBuilder(
              condition: onMainPressed != null,
              onBuild: CustomTextButton(
                child: CustomText(
                  actionLabel ?? "save".tr,
                  color: isMainIconDisabled
                      ? AppColors.buttonDisabled
                      : AppColors.primary,
                  isBold: true,
                ),
                onPressed: onMainPressed,
              ),
              onFeedBack: const SizedBox(),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: XDivider.normal(),
        ),
      ],
    );
  }
}
