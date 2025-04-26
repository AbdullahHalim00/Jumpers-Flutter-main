import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Bloc/controllers/language_controller.dart';
import 'package:jumper/src/Bloc/models/language_model.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Ui/appbars/default_appbar.dart';
import 'package:jumper/src/Ui/listview/custom_listview.dart';
import 'package:jumper/src/Ui/radio/custom_radio_tile.dart';
import 'package:jumper/src/Ui/scaffold/default_scaffold.dart';

class LanguageScreen extends GetView<LanguageController> {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: AppBars.basic(
        title: 'app_lang',
        isBack: true,
      ),
      body: CustomListView(
        children: LanguageData.langList
            .map(
              (e) => CustomRadioTile(
                label: e.langTitle!,
                suffixWidget: CircleAvatar(
                  radius: 12.r,
                  backgroundImage: AssetImage(e.flag ?? Assets.flag),
                ),
                isSelected: controller.getLocale == e.locale,
                onTap: () {
                  printDM(" e.locale is ${controller.getLocale == e.locale}");
                  printDM("_controller.deviceLocale() ${controller.getLocale}");
                  printDM("e.locale ${e.locale}");
                  // setState(() {
                  // for (var element in LanguageData.langList) {
                  //   element.id = 1;
                  // }
                  // e.isSelected = true;
                  controller.changeLanguage(e.id!);
                  // controller.changeLang(e.id);
                  // Get.back();
                  // });
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
