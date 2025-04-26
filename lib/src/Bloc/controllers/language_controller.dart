import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jumper/src/Bloc/models/language_model.dart';
import 'package:jumper/src/Core/services/storage/storage_constants.dart';
import 'package:jumper/src/Features/shared/SplashFeature/ui/screens/splash_imports.dart';

class LanguageController extends GetxController {
  final GetStorage _box = GetStorage();

  Locale? get getLocale {
    int id = _box.read(stgLang) ?? 2;
    for (var element in LanguageData.langList) {
      if (element.id == id) {
        Get.locale = element.locale;
      }

      update();
    }

    return Get.locale;
  }

  void changeLanguage(int id) {
    if (id == 1) {
      Get.updateLocale(const Locale('ar', 'AR'));
    } else if (id == 2) {
      Get.updateLocale(const Locale("en", "US"));
    } else {
      Get.updateLocale(const Locale("en", "US"));
    }
    _box.write(stgLang, id);
    update();
    Get.offAll(const SplashScreen());
  }
}
