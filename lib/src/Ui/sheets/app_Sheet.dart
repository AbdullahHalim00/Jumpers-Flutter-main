import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Ui/buttons/custom_text_button.dart';
import 'package:jumper/src/Ui/circle_avatar/custom_icon_avatar.dart';

import '../../Core/constants/colors/app_colors.dart';
import '../../Core/constants/decorations/app_shapes.dart';
import '../../Core/constants/strings/assets.dart';
import '../spaces_and_dividers/custom_divider.dart';
import '../text/custom_text.dart';

// enum trailingSheetButtonStyle {none,button, }

abstract class AppSheet {
  static void showBottomSheet(
    Widget sheetBody, {
    bool isDismissible = true,
    bool enableDrag = true,
    String title = "",
    VoidCallback? onSavePress,
    String? onSaveTitle,
  }) {
    Get.bottomSheet(
      SheetHeader(
        sheetBody: sheetBody,
        onSaveTitle: onSaveTitle,
        onSavePress: onSavePress,
      ),
      backgroundColor: AppColors.sheets,
      elevation: 2,
      shape: AppShapes.bottomSheetShape,
      isDismissible: isDismissible,
      barrierColor: Colors.black87.withOpacity(0.7),
      enableDrag: true,
    );
  }

  static void showDefaultSheet(
    Widget sheetBody, {
    bool isDismissible = true,
  }) {
    Get.bottomSheet(
      sheetBody,
      backgroundColor: AppColors.sheets,
      elevation: 2,
      shape: AppShapes.bottomSheetShape,
      isDismissible: isDismissible,
      barrierColor: Colors.black87.withOpacity(0.7),
      enableDrag: true,
    );
  }
}

class SheetHeader extends StatelessWidget {
  final Widget sheetBody;
  final bool isDismissible;

  final bool enableDrag;

  final String title;
  final VoidCallback? onSavePress;
  final String? onSaveTitle;

  const SheetHeader({
    Key? key,
    required this.sheetBody,
    this.onSavePress,
    this.onSaveTitle,
    this.title = "",
    this.enableDrag = true,
    this.isDismissible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isDismissible
                  ? CustomIconAvatar(
                      imageUrl: Assets.close,
                      onTap: () => Get.back(),
                    )
                  : const SizedBox(),
              CustomText(
                title,
                fontWeight: FW.semiBold,
                padding: EdgeInsetsDirectional.only(
                    end: isDismissible ? 20.w : 0.0,
                    start: onSavePress != null ? 30.w : 0.0),
              ),
              (onSavePress != null)
                  ? CustomTextButton(
                      onPressed: onSavePress,
                      child: CustomText(
                        onSaveTitle ?? "done".tr,
                        fontSize: 16,
                        fontWeight: FW.semiBold,
                        color: AppColors.primary,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
        XDivider.normal(verticalPadding: 5.0.h),
        Expanded(child: sheetBody),
      ],
    );
  }
}
