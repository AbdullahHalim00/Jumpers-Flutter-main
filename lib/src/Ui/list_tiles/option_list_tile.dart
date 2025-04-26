import 'package:flutter/material.dart';

import '../../Core/constants/colors/app_colors.dart';
import '../spaces_and_dividers/spaces.dart';
import '../text/custom_text.dart';

class OptionListTile extends StatelessWidget {
  final String label;
  final String imageUrl;
  final Color? imageBackgroundColor;

  final bool isBackgroundColor;
  final VoidCallback? onPressed;

  const OptionListTile({
    Key? key,
    this.isBackgroundColor = false,
    this.onPressed,
    required this.label,
    required this.imageUrl,
    this.imageBackgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: null,
      color: (isBackgroundColor) ? (Colors.grey[100]) : (null),
      elevation: 0.0,
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPressed,
        child: Row(
          children: [
            CircleAvatar(
              child: Image.asset(imageUrl),
              backgroundColor: imageBackgroundColor ?? Colors.transparent,
            ),
            XSpace.extreme,
            CustomText(
              label,
              // color: (Get.isDarkMode?AppColors.white:AppColors.black),
              color: AppColors.black,
              fontSize: 14,
            ),
          ],
        ),
      ),
    );
  }
}
