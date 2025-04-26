import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/constants/decorations/app_Insets.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Ui/buttons/custom_rounded_button.dart';
import 'package:jumper/src/Ui/checkbox/default_check_box_tile.dart';
import 'package:jumper/src/Ui/circle_avatar/custom_icon_avatar.dart';
import 'package:jumper/src/Ui/listview/custom_listview.dart';
import 'package:jumper/src/Ui/spaces_and_dividers/spaces.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

class AgreementDialog extends StatelessWidget {
  final String text;

  final String description;
  final String agreementLabel;
  final bool isAgreed;
  final VoidCallback? onAccept;
  final void Function(bool?)? toggleAgreement;

  const AgreementDialog({
    Key? key,
    required this.text,
    required this.description,
    required this.agreementLabel,
    this.onAccept,
    this.isAgreed = false,
    this.toggleAgreement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: double.infinity,
              color: AppColors.primLighter.withOpacity(0.2),
              padding: AppInsets.defaultScreenVertical,
              child: Image.asset(
                Assets.agreement,
                height: 135.h,
                width: 135.h,
              ),
            ),
            CustomIconAvatar(
              onTap: () => Get.back(),
              imageUrl: Assets.close,
            ),
          ],
        ),
        16.0.ESH(),
        Expanded(
          child: CustomListView(
            children: [
              CustomText(
                text,
                fontSize: 14,
                fontWeight: FW.semiBold,
              ),
              YSpace.titan,
              CustomText.subtitle(
                description,
                fontSize: 12,
                fontWeight: FW.light,
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            25.0.ESH(),
            DefaultCheckBoxTile(
              label: agreementLabel,
              isChecked: isAgreed,
              onChanged: toggleAgreement,
            ),
            25.0.ESH(),
            CustomRoundedButton(
              height: 54.h,
              backgroundColor: AppColors.secondary,
              isDisabled: !isAgreed,
              child: CustomText(
                "confirm_accept".tr,
                isUpperCase: true,
                color: Colors.white,
              ),
              onPressed: onAccept,
            ),
          ],
        ),
      ],
    );
  }
}
