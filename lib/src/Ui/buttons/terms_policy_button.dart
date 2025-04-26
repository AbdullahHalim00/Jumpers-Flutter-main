import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:jumper/src/Features/shared/TermsAndConditionsFeature/ui/screen/terms_conditions_imports.dart';

import '../../Core/constants/colors/app_colors.dart';
import '../containers/default_container.dart';
import '../text/custom_text.dart';
import 'custom_text_button.dart';

class TermsAndPolicyButton extends StatelessWidget {
  final Color? color;

  const TermsAndPolicyButton({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      borderColor: Colors.transparent,
      color: color,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextButton(
            onPressed: () => Get.to(() => const TermsScreen()),
            child: CustomText(
              "terms".tr,
              fontSize: 14,
              color: AppColors.primary,
            ),
          ),
          const Icon(
            Icons.circle,
            size: 5,
            color: Colors.grey,
          ),
          CustomTextButton(
            onPressed: () => Get.to(() => const PrivacyScreen()),
            child: CustomText(
              "privacy".tr,
              fontSize: 14,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
