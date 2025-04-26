import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/constants/decorations/app_Insets.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';
import 'package:jumper/src/Ui/circle_avatar/custom_icon_avatar.dart';
import 'package:jumper/src/Ui/containers/default_container.dart';
import 'package:jumper/src/Ui/spaces_and_dividers/spaces.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

class AccountInfoItem extends StatelessWidget {
  final String? label;

  final String? data;

  final String? trailingImgUrl;

  final VoidCallback? onTrailingPressed;

  const AccountInfoItem(
      {Key? key,
      this.label,
      this.data,
      this.trailingImgUrl,
      this.onTrailingPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      hasBorder: false,
      padding: AppInsets.defaultScreenALL,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //"company_or_organization_name".tr
          CustomText.subtitle(
            label ?? "",
            fontSize: 12,
          ),
          YSpace.normal,
          Row(
            children: [
              CustomText.subtitle(
                label ?? "",
                fontSize: 16,
                fontWeight: FW.medium,
              ),
              if (onTrailingPressed != null) ...[
                const Spacer(),
                CustomIconAvatar(
                  imageUrl: trailingImgUrl ?? Assets.edit_2,
                  radius: 26.r,
                  color: AppColors.secondary,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
