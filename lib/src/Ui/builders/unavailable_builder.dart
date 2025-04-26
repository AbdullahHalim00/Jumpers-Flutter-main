import 'package:flutter/material.dart';

class UnAvailableBuilder extends StatelessWidget {
  final Widget? child;
  final bool isVisible;

  const UnAvailableBuilder({
    Key? key,
    required this.child,
    this.isVisible = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      bool _isDark = false; //   bool _isDark = Get.isDarkMode;
      return Visibility(
        visible: isVisible,
        child: AbsorbPointer(
          absorbing: true,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Opacity(
                opacity: 1,
                child: child,
              ),
              // Container(
              //   width: double.infinity,
              //   color: (_isDark?AppColors.black_2:Colors.white24),
              //   child: Center(
              //     child: CustomText.subtitle(
              //       "work_in_progress".tr,
              //       color: Get.isDarkMode?Colors.deepOrange:Colors.deepOrange.withOpacity(0.3),
              //       fontSize: 12,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      );
    });
  }
}
