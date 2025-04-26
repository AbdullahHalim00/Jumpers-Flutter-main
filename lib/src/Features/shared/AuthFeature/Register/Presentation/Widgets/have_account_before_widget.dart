import 'package:flutter/material.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Ui/buttons/button_default.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

class HaveAccountBeforeWidget extends StatelessWidget {
  final VoidCallback onTap;

  const HaveAccountBeforeWidget({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonDefault(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        CustomText(
          "have_acc",
          fontWeight: FW.light,
        ),
        CustomText(
          "login",
          fontWeight: FW.semiBold,
          color: AppColors.titleGreen,
        )
      ]),
      width: 240,
      height: 48,
      buttonColor: Colors.transparent,
      onTap: onTap,
    );
  }
}
