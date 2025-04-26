import 'package:flutter/cupertino.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';

class LanguageModel {
  int? id;
  String? flag;
  String? langTitle;
  Locale locale;

  LanguageModel({
    this.id,
    this.flag,
    required this.locale,
    this.langTitle,
  });
}

class LanguageData {
  LanguageData._();

  static final List<LanguageModel> _langList = [
    LanguageModel(
      id: 1,
      flag: Assets.saudiFlag,
      langTitle: "arabic",
      locale: const Locale('ar', 'AR'),
    ),
    LanguageModel(
      id: 2,
      flag: Assets.uKFlag,
      langTitle: "english",
      locale: const Locale("en", "US"),
    ),
  ];

  static List<LanguageModel> get langList => _langList;

  static Locale locale(int id) {
    if (id == 1) {
      return const Locale('ar', 'AR');
    } else if (id == 2) {
      return const Locale("en", "US");
    } else {
      return const Locale("en", "US");
    }
  }
}
