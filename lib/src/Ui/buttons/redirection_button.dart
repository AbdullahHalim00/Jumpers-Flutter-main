import 'package:flutter/material.dart';

import '../../Core/constants/colors/app_colors.dart';
import '../../Core/constants/strings/assets.dart';
import '../spaces_and_dividers/spaces.dart';
import '../text/custom_text.dart';
import 'custom_rounded_button.dart';

class RedirectionButton extends StatelessWidget {
  final String? label;

  final String? imageUrl;

  final VoidCallback? onPressed;
  final EdgeInsets? padding;

  final bool showIcon;
  final bool reverseOrder;

  const RedirectionButton({
    Key? key,
    this.label,
    this.imageUrl,
    this.padding,
    this.showIcon = true,
    this.reverseOrder = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: CustomRoundedButton(
        backgroundColor: AppColors.secondary,
        padding: padding,
        onPressed: onPressed,
        child: Directionality(
          textDirection: reverseOrder ? TextDirection.ltr : TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (showIcon)
                Image.asset(
                  imageUrl ?? Assets.reload,
                  scale: 4,
                ),
              XSpace.normal,
              CustomText(
                label ?? '',
                color: Colors.white,
                fontSize: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
