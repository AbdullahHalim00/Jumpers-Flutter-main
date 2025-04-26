import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../Core/constants/colors/app_colors.dart';
import '../builders/conditional_builder.dart';
import '../spaces_and_dividers/spaces.dart';
import '../text/custom_text.dart';

class ConfirmationTile extends StatelessWidget {
  final bool isConfirmed;
  final bool showArrowOnly;
  final VoidCallback? onConfirm;

  const ConfirmationTile(
      {Key? key,
      this.isConfirmed = true,
      this.showArrowOnly = false,
      this.onConfirm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: isConfirmed,
      onBuild: Row(
        children: [
          const Icon(
            Icons.verified_user_outlined,
            color: AppColors.primary,
            size: 17,
          ),
          XSpace.light,
          CustomText(
            "confirmed".tr,
            color: AppColors.primary,
            fontSize: 16,
          ),
        ],
      ),
      onFeedBack: showArrowOnly
          ? InkWell(
              onTap: onConfirm, child: const Icon(Icons.arrow_forward_ios))
          : CustomText(
              "not_confirmed".tr,
              color: AppColors.greyPrimary,
              fontSize: 16,
            ),
    );
  }
}
