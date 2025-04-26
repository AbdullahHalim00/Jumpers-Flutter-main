import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Features/company/search_employee/ui/screens/Imports_search_screen.dart';
import 'package:jumper/src/Features/company/search_jobtile_screen/ui/screens/Imports_search_screen.dart';
import 'package:jumper/src/Ui/badges/message_badge.dart';
import 'package:jumper/src/Ui/badges/notification_badge.dart';
import 'package:jumper/src/Ui/circle_avatar/custom_icon_avatar.dart';
import 'package:jumper/src/Ui/logo/app_logo.dart';
import 'package:jumper/src/Ui/spaces_and_dividers/spaces.dart';

import '../text/custom_text.dart';

class AppBars extends StatelessWidget  {
  final AppBar _appBar;
  final double? toolbarHeight;
  final double? bottomHeight;

  const AppBars._(
    this._appBar, {
    Key? key,
    this.toolbarHeight,
    // ignore: unused_element
    this.bottomHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _appBar;
  }

  @override
  Size get preferredSize =>
      Size.fromHeight((toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  factory AppBars.logo({
    double? toolbarHeight,
  }) {
    return AppBars._(
      AppBar(
        title: AppLogo.defaultLogo(
          height: 45.h,
          width: 60.w,
        ),
        automaticallyImplyLeading: false,
        toolbarHeight: toolbarHeight ?? kToolbarHeight,
      ),
      toolbarHeight: toolbarHeight ?? kToolbarHeight,
    );
  }

  factory AppBars.basic({
    String? title,
    List<Widget>? actions,
    double? toolbarHeight,
    Widget? titleWidget,
    bool? centerTitle,
    bool isTitleBold = false,
    bool isBack = false,
    Widget? leading,
    Color? color,
  }) {
    return AppBars._(
      AppBar(
        title: titleWidget ?? CustomText(title!, isBold: isTitleBold),
        actions: actions,
        centerTitle: centerTitle,
        shadowColor: Colors.green,
        automaticallyImplyLeading: false,
        leading: isBack
            ? IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back),
              )
            : leading,
        backgroundColor: color,
      ),
      toolbarHeight: toolbarHeight ?? kToolbarHeight,
    );
  }

  factory AppBars.employee({
    String? title,
    PreferredSizeWidget? bottom,
  }) {
    return AppBars._(
      AppBar(
        toolbarHeight: bottom != null ? kToolbarHeight.h * 2 : kToolbarHeight,
        title: CustomText(
          title ?? "employee".tr,
          fontWeight: FW.bold,
        ),
        centerTitle: false,
        actions: [
          // CustomIconAvatar(
          //   imageUrl: Assets.setting,
          //   onTap: () => AppSheet.showDefaultSheet(
          //     const BuildEmployeeByOrderSheet(),
          //
          //   ),
          // ),
          CustomIconAvatar(
            imageUrl: Assets.search,
            onTap: () => Get.to(() => const SearchEmployeeScreen()),
          ),
          const MessageBadge(),
          const NotificationBadge(),
        ],
        bottom: bottom,
      ),
      toolbarHeight: (kToolbarHeight * 1.86).h,
    );
  }

  factory AppBars.chats({
    String? title,
    PreferredSizeWidget? bottom,
  }) {
    return AppBars._(
      AppBar(
        toolbarHeight: bottom != null ? kToolbarHeight.h * 2 : kToolbarHeight,
        title: CustomText(
          title ?? "employee".tr,
          fontWeight: FW.bold,
        ),
        centerTitle: false,
        bottom: bottom,
      ),
      toolbarHeight: (kToolbarHeight * 1.86).h,
    );
  }

  factory AppBars.jobs({
    Widget? dropDownTitle,
  }) {
    return AppBars._(
      AppBar(
        title: dropDownTitle,
        centerTitle: false,
        actions: [
          CustomIconAvatar(
            imageUrl: Assets.search,
            onTap: () => Get.to(() => const SearchJobTileScreen()),
          ),
          const MessageBadge(),
          const NotificationBadge(),
        ],
      ),
      toolbarHeight: (kToolbarHeight).h,
    );
  }

  factory AppBars.more({
    String? name,
    String? address,
    String? image,
  }) {
    return AppBars._(
      AppBar(
        backgroundColor: AppColors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CircleAvatar(
              radius: 28.r,
              backgroundImage: NetworkImage(
                (image != "" && image != null)
                    ? image
                    : Assets.networkKDefaultUser,
              ),
            ),
            XSpace.hard,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    name ?? "",
                    fontSize: 15,
                    fontWeight: FW.semiBold,
                    isOverFlow: true,
                  ),
                  7.0.ESH(),
                  Tooltip(
                    message: "$address",
                    child: CustomText.subtitle(
                      (address != null && address != "") ? address : "-",
                      fontSize: 13,
                      fontWeight: FW.regular,
                      isOverFlow: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        centerTitle: false,
      ),
      toolbarHeight: (70).h,
    );
  }
}
