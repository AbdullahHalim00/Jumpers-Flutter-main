import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget icon;
  final BoxConstraints? constraints;
  final Color? color;
  final Color? circleColor;
  final double iconSize;
  final String? tooltip;
  final bool enableFeedback;
  final bool isCircleSurrounded;
  final EdgeInsets? padding;

  const CustomIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.constraints,
    this.padding,
    this.color,
    this.iconSize = 24.0,
    this.tooltip,
    this.enableFeedback = true,
    this.isCircleSurrounded = false,
    this.circleColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: padding ?? const EdgeInsets.all(8.0),
      key: key,
      onPressed: onPressed,
      tooltip: tooltip,
      enableFeedback: enableFeedback,
      // iconSize: iconSize,
      color: color,
      constraints: constraints,
      iconSize: iconSize,
      icon: isCircleSurrounded
          ? CircleAvatar(
              backgroundColor: circleColor,
              foregroundColor: color,
              child: icon,
              radius: 20.0,
            )
          : icon,
    );
  }
}
