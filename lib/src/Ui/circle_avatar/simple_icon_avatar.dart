import 'package:flutter/material.dart';

import '../../Core/constants/colors/app_colors.dart';

// enum IconAvatarType {SIMPLE,WITH_BACkGROUND}
class SimpleIconAvatar extends StatelessWidget {
  final String imageUrl;

  final double? side;

  final Color borderColor;

  final Color? color;

  final GestureTapCallback? onTap;

  // final IconAvatarType iconAvatarType;

  const SimpleIconAvatar({
    Key? key,
    required this.imageUrl,
    this.side,
    this.borderColor = AppColors.primary,
    this.color,
    this.onTap,
    // this.iconAvatarType=IconAvatarType.SIMPLE,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: side ?? MediaQuery.of(context).size.height * 0.06,
        width: side ?? MediaQuery.of(context).size.height * 0.06,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: borderColor,
          ),
        ),
        child: Image.asset(imageUrl),
      ),
    );
  }
}
