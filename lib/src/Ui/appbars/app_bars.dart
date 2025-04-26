import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/utils/extensions.dart';

import '../text/custom_text.dart';

class AppBarss {
  static AppBar appBarDefault(
      {bool isBack = true,
      TabBar? tabBar,
      String title = '',
      Widget secondIconImage = const SizedBox(
        width: 0,
      ),
      VoidCallback? onTap}) {
    return AppBar(
      title: CustomText(
        title,
        fontWeight: FW.semiBold,
        fontSize: 16,
        color: AppColors.black,
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
      leading: isBack == false
          ? 0.0.ESH()
          : IconButton(
              onPressed: onTap ??
                  () {
                    Get.back();
                  },
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.black,
                size: 24.h,
              ),
            ),
      actions: [secondIconImage],
      bottom: tabBar,
    );
  }

  //
  // static AppBar appBarPost({ bool isBack=true, TabBar? tabBar,String title='',Widget secondIconImage=const SizedBox(width: 0,) , VoidCallback? onTap}){
  //   return AppBar(
  //     title: CustomText(
  //       text: title,
  //       fontW: FW.semibold,
  //       fontSize: 16,
  //       color: kCBlackTitle,
  //     ),
  //     backgroundColor: Colors.white,
  //     centerTitle: true,
  //     elevation: 0.0,
  //     leading:isBack==false?0.0.ESH() :IconButton(
  //       onPressed: onTap??(){
  //        Get.back();
  //       },
  //       icon: Icon(
  //         Icons.arrow_back,
  //         color: AppColors.black,
  //         size: 24.h,
  //       ),
  //     ),
  //     actions: [
  //       secondIconImage
  //
  //     ],
  //     bottom: tabBar,
  //   );
  // }

  static AppBar appBarSkipDefault(
      {bool isBack = true,
      TabBar? tabBar,
      String title = '',
      Widget secondIconImage = const SizedBox(
        width: 0,
      ),
      VoidCallback? onTapBack,
      VoidCallback? onTapSkip,
      bool isSkip = false}) {
    return AppBar(
      title: CustomText(
        title,
        fontWeight: FW.semiBold,
        fontSize: 16,
        color: AppColors.black,
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
      leading: isBack == false
          ? 0.0.ESH()
          : IconButton(
              onPressed: onTapBack ??
                  () {
                    Get.back();
                  },
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.black,
                size: 24.h,
              ),
            ),
      actions: [
        isSkip == true
            ? IconButton(
                onPressed: onTapSkip,
                icon: CustomText(
                  "skip_".tr,
                  fontWeight: FW.semiBold,
                  fontSize: 12,
                ),
              )
            : 0.0.ESH()
      ],
      bottom: tabBar,
    );
  }

  static AppBar appBarLogo(
      {String logo = 'logo.png', VoidCallback? onDrawerTap}) {
    return AppBar(
      title: Image.asset(
        'assets/icons/$logo',
        height: 35.h,
      ),
      leading: onDrawerTap != null
          ? IconButton(
              onPressed: onDrawerTap,
              icon: Icon(
                Icons.menu,
                color: AppColors.black,
                size: 24.h,
              ),
            )
          : null,
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
    );
  }
}
