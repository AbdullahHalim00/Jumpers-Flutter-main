import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../../Core/constants/colors/app_colors.dart';
import '../spaces_and_dividers/spaces.dart';
import '../text/custom_text.dart';

class ExpandableListTile extends StatelessWidget {
  final String label;
  final IconData? prefixIcon;
  final IconData expandIcon;
  final IconData collapseIcon;
  final Widget? child;
  final VoidCallback? onPressed;
  final Color? primaryColor;
  final Color? prefixIconColor;
  final double fontSize;

  final double iconsSize;

  final double? iconPadding;

  const ExpandableListTile({
    Key? key,
    this.child,
    this.onPressed,
    required this.label,
    this.prefixIcon,
    this.primaryColor = AppColors.primary,
    this.prefixIconColor = Colors.white,
    this.fontSize = 16.0,
    this.iconsSize = 14.0,
    this.iconPadding = 0.0,
    this.expandIcon = Icons.keyboard_arrow_down,
    this.collapseIcon = Icons.keyboard_arrow_up,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      elevation: 0.0,
      padding: const EdgeInsets.all(8.0),
      child: ExpandablePanel(
        theme: ExpandableThemeData(
          iconPadding:
              iconPadding != null ? EdgeInsets.all(iconPadding ?? 0) : null,
          expandIcon: expandIcon,
          collapseIcon: collapseIcon,
          iconColor: primaryColor,
          iconSize: iconsSize,
        ),
        header: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (prefixIcon != null)
              CircleAvatar(
                child: Icon(
                  prefixIcon,
                  color: prefixIconColor,
                ),
                backgroundColor: primaryColor,
              ),
            if (prefixIcon != null) XSpace.extreme,
            Expanded(
              child: CustomText(
                label,
                isBold: true,
                color: primaryColor,
                fontSize: fontSize,
              ),
            ),
          ],
        ),
        collapsed: const Visibility(
          visible: false,
          child: CustomText(''),
        ),
        expanded: child ?? const SizedBox(),
      ),
    );
  }
}
