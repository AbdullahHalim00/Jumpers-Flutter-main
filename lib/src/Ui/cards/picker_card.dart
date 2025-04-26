import 'package:flutter/material.dart';

import '../../Core/constants/colors/app_colors.dart';

class PickerCard extends StatelessWidget {
  // final AvailablePackages packages;
  final VoidCallback? onPressed;
  final bool isSelected;

  final Widget child;
  final EdgeInsets? padding;

  const PickerCard({
    Key? key,
    // this.packages = AvailablePackages.SINGLE,
    this.onPressed,
    required this.isSelected,
    required this.child,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20.0),
        // splashColor: App,
        onTap: onPressed,
        splashColor: AppColors.primLighter,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          decoration: BoxDecoration(
            // color:  isSelected ? AppColors.primary : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: isSelected ? AppColors.primary : Colors.grey.shade300,
              width: 0.6,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
