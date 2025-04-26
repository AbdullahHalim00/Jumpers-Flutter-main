import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Ui/buttons/custom_outlined_button.dart';
import 'package:jumper/src/Ui/buttons/custom_rounded_button.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

class DialogAddJobSuccessfully extends StatelessWidget {
  final VoidCallback onOkTap;

  const DialogAddJobSuccessfully({required this.onOkTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/application_accepted.png",
              height: 162.h,
              width: 171.w,
              fit: BoxFit.cover,
            ),
            19.0.ESH(),
            const CustomText(
              "add_job_successfully",
              fontSize: 14,
              isBold: true,
            ),
            16.0.ESH(),
            CustomText.subtitle(
              "do_you_need_see_your_request",
              fontSize: 12,
              fontWeight: FW.light,
            ),
            57.0.ESH(),
            Row(
              children: [
                Expanded(
                  child: CustomRoundedButton(
                    height: 44.h,
                    backgroundColor: AppColors.secondary,
                    child: const CustomText(
                      "yes_sure",
                      color: AppColors.white,
                      fontSize: 12,
                    ),
                    onPressed: () {
                      onOkTap();
                    },
                  ),
                ),
                16.0.ESW(),
                Expanded(
                  child: CustomOutlinedButton(
                    height: 44.h,
                    isCurvedBorders: true,
                    backgroundColor: AppColors.containerBCGGrey,
                    primaryColor: AppColors.transparent,
                    child: const Center(
                      child: CustomText(
                        "backing_down",
                        fontSize: 12,
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        // CustomIconAvatar(
        //   imageUrl: Assets.close,
        //   onTap: () {
        //     Get.back();
        //   },
        // ),
      ],
    );
  }
}
