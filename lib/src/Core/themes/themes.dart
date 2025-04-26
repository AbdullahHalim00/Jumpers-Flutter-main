import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors/app_colors.dart';
import '../constants/strings/app_strings.dart';

class Themes {
  Themes._();

  static final lightTheme = ThemeData(
    androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    bottomAppBarColor: AppColors.primary,
    indicatorColor: AppColors.tabIndicator,
    scaffoldBackgroundColor: AppColors.mainPrimBCGLight,
    // splashColor: ,
    // backgroundColor: kLightBCGColor,
    // primaryColor: kPrimaryColor,
    // // primarySwatch: kPrimaryColor,
    // fontFamily: fontFamily,
    fontFamily: AppStrings.fontFamily,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primary,
    ),
    tooltipTheme: TooltipThemeData(
      padding: EdgeInsets.all(15.h),
      margin: EdgeInsets.only(top: 15.h, left: 15.w, right: 15.w),
      enableFeedback: true,
      // waitDuration: ,
      decoration: BoxDecoration(
        color: AppColors.secondary.withOpacity(0.6),
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.greyDarker,
      selectedLabelStyle: TextStyle(
        fontSize: 11,
        color: AppColors.primary,
        fontWeight: FontWeight.w600,
      ),

      // unselectedItemColor: kSecondaryColorLight,
      elevation: 5.0,
      type: BottomNavigationBarType.fixed,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: Colors.black87, fontSize: 18.0, fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(color: Colors.black),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: AppColors.tabEnabled,
      unselectedLabelColor: AppColors.tabDisabled,
    ),
    // textTheme: const TextTheme(
    //   bodyText1: TextStyle(color: kLightColor),
    //   bodyText2: TextStyle(color: kDarkSecondaryColor),
    //   headline5: TextStyle(color: kDarkSecondaryColor),
    //   headline6: TextStyle(color: kDarkSecondaryColor),
    //   subtitle1: TextStyle(color: kDarkSecondaryColor),
    //   subtitle2: TextStyle(color: kDarkSecondaryColor),
    //   button: TextStyle(fontSize: 12,color: kDarkSecondaryColor),
    //   caption: TextStyle(color: Colors.grey),
    //   overline: TextStyle(color: kDarkSecondaryColor),
    // ),
    // // radioTheme: RadioThemeData(
    // //   fillColor: MaterialStateProperty.all(Color(0xff5156454)),
    // //   overlayColor:  MaterialStateProperty.all(Colors.red),
    // // ),
    //
    // popupMenuTheme: const PopupMenuThemeData(
    //   color: kLightSecondaryColor,
    //   textStyle: TextStyle(color: kThirdColor),
    // ),
    // iconTheme: const IconThemeData(color: kDarkColor),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: AppColors.secondary,
        shadowColor: AppColors.secondary.withOpacity(0.1),
        side: const BorderSide(
          width: 1,
          color: AppColors.secondary,
        ),
      ),
    ),
  );
}
