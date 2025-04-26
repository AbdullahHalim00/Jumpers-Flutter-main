import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:flutter_barcode_scanner/flutter_barcode_scanner.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jumper/src/Bloc/models/language_model.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';
import 'package:jumper/src/Core/services/app_data/app_data.dart';
import 'package:jumper/src/Core/services/audio_service.dart';
import 'package:jumper/src/Core/services/storage/storage_constants.dart';
import 'package:jumper/src/Ui/loading/loading.dart';
import 'package:jumper/src/Ui/sheets/app_Sheet.dart';
import 'package:jumper/src/Ui/spaces_and_dividers/custom_divider.dart';
import 'package:jumper/src/Ui/spaces_and_dividers/spaces.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors/app_colors.dart';
import '../constants/decorations/app_shapes.dart';

// TODO : add the most main used functions here !

/// Contains most of the main app methods (( depending on some packages ))
class Utils {
  static Locale get cachedLocale {
    return LanguageData.locale(GetStorage().read(stgLang) ?? 1);
  }

  /// converts String to money pattern
  static String convertToMoney(String amount) {
    double number = double.parse(amount);
    final currencyArabic = NumberFormat("#,##0", "ar_AR");
    final currencyEnglish = NumberFormat("#,##0.00", "en_US");
    if (cachedLocale.toString() == "ar_AR") {
      return currencyArabic.format(number);
    } else {
      return currencyEnglish.format(number);
    }
  }

  /// hide Bank Account Number
  static String obsecureCardNumber(String number) {
    String afterHide = number.replaceRange(2, number.length - 3, '******');
    // return number.replaceRange(1, number.length~/2, "****");
    return afterHide;
    // return number.replaceRange(3, 6, "****");
  }

  /// -------------------------- ClipBoard -------------------------------------
  /// Allow you to copy [Text] to clipboard
  static Future<void> copyToClipboard(String text) async {
    await Clipboard.setData(
      ClipboardData(text: text),
    );
  }

  static void closeDialog() {
    printDM(">>>>> ${(Get.isDialogOpen)}");
    if (Get.isDialogOpen!) Get.back();
  }

  static Future<void> closeSnackbar() async{
    printDM(">>>>> ${(Get.isSnackbarOpen)}");
    if(Get.isSnackbarOpen) await Get.closeCurrentSnackbar();
  }

  /// ------------------------------ Snack -------------------------------------

  /// snackBar
  static void showDefaultSnackBar({
    String title = "",
    UtilState state = UtilState.None,
    Color? titleColor = Colors.white,
  }) {
    Get.snackbar(
      "",
      "",
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
      duration: const Duration(seconds: 3),
      snackStyle: SnackStyle.FLOATING,
      margin: const EdgeInsets.all(10),
      titleText: CustomText(
        title,
        padding: const EdgeInsets.only(top: 25),
        // color:  (state==SnackState.Warning? Colors.black :titleColor),
        color: titleColor,
        fontWeight: FW.semiBold,
        fontSize: 15,
      ),
      borderRadius: 10,
      padding: const EdgeInsets.all(0),
      icon: _getSnackBarIcon(state),
      backgroundColor: _getSnackBarBackground(state),
    );
  }

  static void showActionSnackBar({
    String title = "",
    UtilState state = UtilState.None,
    Color? titleColor = Colors.white,
    Color? backgroundColor,
    GestureTapCallback? onMainPressed,
    Duration? duration,
    IconData? suffixIcon = Icons.arrow_forward_ios_rounded,
  }) {
    Get.snackbar(
      "",
      "",
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
      duration: duration ?? const Duration(seconds: 3),
      snackStyle: SnackStyle.FLOATING,
      margin: const EdgeInsets.all(10),
      titleText: InkWell(
        onTap: onMainPressed,
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Row(
            children: [
              CustomText(
                title,
                // color:  (state==SnackState.Warning? Colors.black :titleColor),
                color: titleColor,
                fontWeight: FW.semiBold,
                fontSize: 15,
              ),
              const Spacer(),
              Icon(
                suffixIcon,
                size: 15,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
      borderRadius: 10,
      padding: const EdgeInsets.all(0),
      icon: _getSnackBarIcon(state),
      backgroundColor: backgroundColor ?? _getSnackBarBackground(state),
    );
  }

  /// returns snackBar [backgroundColor] according to [UtilState]
  static Color _getSnackBarBackground(UtilState state) {
    Color? color;
    switch (state) {
      case UtilState.Success:
        color = Colors.black;
        break;
      case UtilState.Warning:
        color = Colors.amber.shade600;
        break;
      case UtilState.Error:
        color = Colors.red;
        break;
      case UtilState.None:
        color = Colors.black;
        break;
    }
    return color;
  }

  static Widget _getSnackBarIcon(UtilState state) {
    Widget? icon;
    switch (state) {
      case UtilState.Success:
        icon = CircleAvatar(
          radius: 13,
          backgroundColor: Colors.green.shade800,
          child: const Icon(
            Icons.done,
            color: Colors.white,
            size: 18,
          ),
        );
        break;
      case UtilState.Warning:
        icon = const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 13,
            child: Icon(
              Icons.warning,
              color: Colors.amber,
              size: 18,
            ));
        break;
      case UtilState.Error:
        icon = const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 13,
            child: Icon(
              Icons.error_outlined,
              color: Colors.red,
              size: 18,
            ));
        break;
      case UtilState.None:
        icon = const SizedBox();
        break;
    }
    return icon;
  }

  /// material banner
  ///
  static void showSnackNotificationBar({
    required String title,
    required String body,
    Widget? customIcon,
    IconData? icon,
  }) {
    Get.snackbar(
      title,
      body,
      duration: const Duration(seconds: 2),
      icon: customIcon ?? Icon(icon),
    );
  }

  /// ------------------------------ toast --------------------------------------

  static void showToast({
    required String title,
    Color textColor = Colors.white,
    ToastGravity gravity = ToastGravity.BOTTOM,
    required UtilState state,
  }) {
    Fluttertoast.showToast(
      msg: title,
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity,
      timeInSecForIosWeb: 5,
      backgroundColor: _toastColor(state),
      textColor: textColor,
      fontSize: 16.0,
    );
  }

  static Color _toastColor(UtilState utilState) {
    Color? color;
    switch (utilState) {
      case UtilState.Success:
        color = AppColors.green;
        break;
      case UtilState.Warning:
        color = Colors.amber.shade600;
        break;
      case UtilState.Error:
        color = AppColors.red;
        break;
      case UtilState.None:
        color = Colors.black;
        break;
    }
    return color;
  }

  /// ------------------------------ Pop up  --------------------------------------
  static void showPopupMenu<T>(BuildContext context,
      {required List<PopupMenuEntry<T>> popUps,
      // required List <void> actions,
      RelativeRect? position}) {
    showMenu<T>(
      context: context,
      position: const RelativeRect.fromLTRB(25.0, 25.0, 0.0, 0.0),
      items: popUps,
      elevation: 8.0,
    );
    // ).then<void>((dynamic itemSelected) {
    //
    //   if (itemSelected == null) {
    //     return;
    //   } else {
    //    for (int i =0 ; i<= popUps.length ; i++){
    //      actions[i];
    //    }
    //   }
    // },
    // );
  }

  /// ------------------------------ Dialog  --------------------------------------

  static void showDialog({
    Widget? child,
    bool isDismissible = true,
    EdgeInsets insetPadding =
        const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
    EdgeInsetsGeometry contentPadding =
        const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
  }) {
    Get.dialog(
      AlertDialog(
        insetPadding: insetPadding,
        contentPadding: contentPadding,
        shape: AppShapes.dialogShape,
        content: SizedBox(
          width: Get.mediaQuery.size.width,
          child: child,
        ),
      ),
      transitionCurve: Curves.fastLinearToSlowEaseIn,
      barrierColor: const Color(0xff333333).withOpacity(0.9),
      barrierDismissible: isDismissible,
    );
  }

  ///change later
  static Future<void> showPreviewDialog({
    required Widget child,
    bool closeAfterAWhile = true,
  }) async {
    await AppData.applyHapticFeedback();
    await AudioService.play(Assets.audio_zoom_in);
    // play sound
    Get.dialog(
      child,
      transitionCurve: Curves.fastLinearToSlowEaseIn,
    );
    if (closeAfterAWhile) {
      Future.delayed(const Duration(milliseconds: 1500), () {}).then((_) async {
        if (Get.isDialogOpen!) {
          Get.back();
          await AudioService.play(Assets.audio_zoom_out);
          AppData.applyHapticFeedback(vibration: true);
        }
      });
    }
  }

  /// ------------------------------ dialog --------------------------------------
  static void showCaseLoader() {
    showLoadingDialog(
      loading: Loading.caseLoading(),
    );
    // Get.dialog(
    //   Dialog(
    //     child: LottieBuilder.asset(
    //       Assets.lottie_loader_case,
    //       height: 20.h,
    //       width: 20.h,
    //     ),
    //   ),
    //   transitionCurve: Curves.fastLinearToSlowEaseIn,
    // );
  }

  static void showLoadingDialog(
      {Loading? loading, Color? color, bool isDark = false}) {
    Get.dialog(
      Dialog(
        child: Container(
          width: Get.mediaQuery.size.width * 0.1,
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              loading ??
                  Loading.fadingCircle(size: 50.r, color: AppColors.greyDarker),
              YSpace.normal,
              CustomText.subtitle("Loading ...."),
            ],
          ),
        ),
        shape: AppShapes.dialogShape,
        backgroundColor: color ?? (AppColors.mainPrimBCGLight),
        elevation: 5,
        // insetPadding: const EdgeInsets.all(2.0),
      ),
      transitionCurve: Curves.fastLinearToSlowEaseIn,
    );
  }

  /// Launch Url
  static Future launchURL(String url, {bool inApp = false}) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: inApp,
        forceWebView: inApp,
        enableJavaScript: true,
      );
    }
  }

  /// returns the picked Image sheet to choose between [Camera] or [Gallery] and between [individual] and [multi] images
  static Future<File?> pickMediaSheet() async {
    File? pickedImage;
    AppSheet.showBottomSheet(
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              XDivider.normal(
                color: AppColors.greyOverlay,
                verticalPadding: 20.h,
                horizontalPadding: 150.w,
              ),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
          ListTile(
            onTap: () async {
              pickedImage = await pickImage(
                source: ImageSource.camera,
              );
            },
            leading: const Icon(Icons.camera_rounded),
            title: CustomText.subtitle("From Camera"),
          ),
          ListTile(
            onTap: () async {
              pickedImage = await pickImage(
                source: ImageSource.camera,
              );
            },
            leading: const Icon(Icons.image_outlined),
            title: CustomText.subtitle("From Gallery"),
          ),
        ],
      ),
    );
    return pickedImage;
  }

  /// returns the picked Image
  static Future<File?> pickImage(
      {ImageSource source = ImageSource.camera}) async {
    File? pickedImage;

    try {
      await ImagePicker()
          .pickImage(
        source: source,
      )
          .then((value) {
        if (value != null) {
          pickedImage = File(value.path);
          debugPrint("pickedImage is : $pickedImage");
        }
      }).catchError((e) {
        debugPrint("Error in picking image is : $e");
      });
    } on PlatformException catch (e) {
      debugPrint(
          "Failed To pick an Image Bc of  =>> Platform exception is : $e");
    }
    return pickedImage;
  }

  /// returns the picked [Images]
  static Future<List<File>> pickImages({
    ImageSource source = ImageSource.camera,
    CameraDevice cameraDevice = CameraDevice.rear,
  }) async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? result = await _picker.pickMultiImage();
    if (result != null) {
      List<File> files = result.map((e) => File(e.path)).toList();
      return files;
    } else {
      return [];
    }
  }

  /// returns scanned qr code as a string
  ///This method depends on [FlutterBarcodeScanner] package
  /// requires extra steps for Ios configuration
  static Future<String> scanQRCode({ScanMode scanMode = ScanMode.QR}) async {
    String scannedQr;

    ///TODO : add configuration to ios
    try {
      scannedQr = await FlutterBarcodeScanner.scanBarcode(
        "#1196c1",
        "cancel".tr,
        true,
        scanMode,
      );
    } on PlatformException {
      throw "Platform Exception was found";
    } catch (e) {
      debugPrint("Error in scanning QR is : => $e");
      scannedQr = "Failed to get QR Code";
    }
    return scannedQr;
  }
}

enum UtilState {
  Success,
  Warning,
  Error,
  None,
}

/// TODO : just print in debugMode

void printDM(String title) {
  if (kDebugMode) {
    log(title);
  }
}
