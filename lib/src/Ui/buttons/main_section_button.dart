import 'package:flutter/material.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Ui/buttons/custom_text_button.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

class MainSectionButton extends StatelessWidget {
  final String label;

  final String? trailing;
  final EdgeInsets? margin;

  final VoidCallback? onPressed;

  const MainSectionButton({
    Key? key,
    required this.label,
    this.trailing,
    this.onPressed,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      child: Row(
        children: [
          CustomText(
            label,
            fontSize: 14,
          ),
          if (trailing != null) ...[
            const Spacer(),
            CustomTextButton(
              child: CustomText(
                "$trailing",
                color: AppColors.primary,
                fontSize: 12,
              ),
              onPressed: onPressed,
            ),
          ],
        ],
      ),
    );
  }
}
