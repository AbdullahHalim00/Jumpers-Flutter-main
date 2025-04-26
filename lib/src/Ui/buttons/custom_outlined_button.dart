import 'package:flutter/material.dart';

import '../../Core/constants/colors/app_colors.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final bool isEnabled;
  final bool isCurvedBorders;
  final Color? backgroundColor;
  final Color? primaryColor;
  final String tooltip;
  final double? height;
  final double? width;
  final EdgeInsets? innerPadding;

  const CustomOutlinedButton({
    Key? key,
    this.onPressed,
    required this.child,
    this.isCurvedBorders = false,
    this.isEnabled = true,
    this.backgroundColor,
    this.primaryColor,
    this.tooltip = '',
    this.height,
    this.width,
    this.innerPadding,
  }) : super(key: key);

  /// icon constructor ---------------------------------------------------------

  factory CustomOutlinedButton.icon({
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
      CustomOutlinedButton(
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
  factory CustomOutlinedButton.image({
    Key? key,
    required String label,
    required ImageProvider image,
    VoidCallback? onPressed,
    bool isEnabled = true,
    bool isCurvedBorders = false,
    bool isUpperCase = false,
    Color? backgroundColor,
    Color? primaryColor,
    Color? innerColor = AppColors.primary,
    String tooltip = '',
    double side = 20,
    double? height,
  }) =>
      CustomOutlinedButton(
        key: key,
        height: height,
        onPressed: onPressed,
        backgroundColor: backgroundColor,
        isCurvedBorders: isCurvedBorders,
        isEnabled: isEnabled,
        tooltip: tooltip,
        primaryColor: primaryColor,
        child: _ImageOutlinedChild(
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
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        key: key,
        onPressed: isEnabled ? onPressed : null,
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          shadowColor: primaryColor?.withOpacity(0.1),
          side: BorderSide(
            width: 1,
            color: primaryColor ?? AppColors.primary,
          ),
          shape: isCurvedBorders
              ? const RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.all(
                  Radius.circular(8.0),
                ))
              : null,
          backgroundColor: backgroundColor,
        ),
        child: tooltip != ''
            ? Padding(
                padding: innerPadding ?? EdgeInsets.zero,
                child: Tooltip(
                  message: tooltip,
                  child: child,
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: child,
              ),
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
          child: Text(
            isUpperCase ? label.toUpperCase() : label,
            textAlign: TextAlign.center,
            style:
                Theme.of(context).textTheme.labelLarge?.copyWith(color: color),
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

  const _ImageOutlinedChild({
    Key? key,
    required this.image,
    required this.label,
    this.color,
    required this.isUpperCase,
    required this.side,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isUpperCase ? label.toUpperCase() : label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: color,
                fontSize: 11,
              ),
        ),
        const SizedBox(
          width: 5,
        ),
        Image(
          image: image,
          width: side,
          height: side,
        ),
      ],
    );
  }
}
