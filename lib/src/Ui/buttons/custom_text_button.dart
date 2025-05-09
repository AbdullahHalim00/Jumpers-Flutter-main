import 'package:flutter/material.dart';

import '../../Core/constants/colors/app_colors.dart';
import '../text/custom_text.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final bool isEnabled;
  final bool isCurvedBorders;
  final Color? backgroundColor;
  final Color? primaryColor;
  final String tooltip;

  const CustomTextButton({
    Key? key,
    this.onPressed,
    required this.child,
    this.isCurvedBorders = false,
    this.isEnabled = true,
    this.backgroundColor,
    this.primaryColor,
    this.tooltip = '',
  }) : super(key: key);

  /// icon constructor ---------------------------------------------------------

  factory CustomTextButton.icon({
    Key? key,
    required String label,
    required IconData icon,
    VoidCallback? onPressed,
    bool isEnabled = true,
    bool isCurvedBorders = false,
    bool isUpperCase = false,
    Color? backgroundColor,
    Color? primaryColor,
    Color? innerColor = AppColors.primary,
    String tooltip = '',
  }) =>
      CustomTextButton(
        key: key,
        onPressed: onPressed,
        backgroundColor: backgroundColor,
        isCurvedBorders: isCurvedBorders,
        isEnabled: isEnabled,
        tooltip: tooltip,
        primaryColor: primaryColor,
        child: _IconOutlinedChild(
          label: label,
          icon: icon,
          color: innerColor,
          isUpperCase: isUpperCase,
        ),
      );

  /// image constructor --------------------------------------------------------
  factory CustomTextButton.image({
    Key? key,
    required String label,
    required ImageProvider image,
    CustomTextDecoration decoration = CustomTextDecoration.none,
    VoidCallback? onPressed,
    bool isEnabled = true,
    bool isCurvedBorders = false,
    bool isUpperCase = false,
    Color? backgroundColor,
    Color? primaryColor,
    Color? innerColor = AppColors.primary,
    String tooltip = '',
    double side = 20,
  }) =>
      CustomTextButton(
        key: key,
        onPressed: onPressed,
        backgroundColor: backgroundColor,
        isCurvedBorders: isCurvedBorders,
        isEnabled: isEnabled,
        tooltip: tooltip,
        primaryColor: primaryColor,
        child: _ImageOutlinedChild(
          decoration: decoration,
          key: key,
          label: label,
          image: image,
          side: side,
          color: innerColor,
          isUpperCase: isUpperCase,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: key,
      onPressed: isEnabled ? onPressed : null,
      child: tooltip != ''
          ? Tooltip(
              message: tooltip,
              child: child,
            )
          : child,
      style: TextButton.styleFrom(
        primary: primaryColor ?? AppColors.primary,
        shape: isCurvedBorders ? const StadiumBorder() : null,
        backgroundColor: backgroundColor,
      ),
    );
  }
}

class _IconOutlinedChild extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;
  final bool isUpperCase;

  const _IconOutlinedChild({
    Key? key,
    required this.icon,
    required this.label,
    this.color,
    required this.isUpperCase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        Expanded(
          child: CustomText(
            isUpperCase ? label.toUpperCase() : label,
            textAlign: TextAlign.center,
            color: color,
          ),
        ),
      ],
    );
  }
}

class _ImageOutlinedChild extends StatelessWidget {
  final ImageProvider image;
  final String label;
  final Color? color;
  final bool isUpperCase;
  final double side;

  final CustomTextDecoration decoration;

  const _ImageOutlinedChild({
    Key? key,
    required this.image,
    required this.label,
    this.color,
    required this.isUpperCase,
    required this.side,
    this.decoration = CustomTextDecoration.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
          image: image,
          width: side,
          height: side,
        ),
        Expanded(
          child: CustomText(
            isUpperCase ? label.toUpperCase() : label,
            decoration: decoration,
            textAlign: TextAlign.center,
            color: color,
          ),
        ),
      ],
    );
  }
}
