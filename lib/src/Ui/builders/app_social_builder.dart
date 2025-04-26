import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:jumper/src/Core/utils/utils.dart';

import '../../Bloc/models/app_socials_model.dart';
import '../../Core/services/app_data/app_data.dart';
import '../text/custom_text.dart';

class AppSocialBuilder extends StatelessWidget {
  /// simply replace this list with the one from API
  final List<AppSocialsModel> socialList;

  const AppSocialBuilder({
    Key? key,
    required this.socialList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 10.0,
          ),
          child: SizedBox(
            // height: MediaQuery.of(context).size.height * 0.1,
            child: Wrap(
              children: List.generate(socialList.length, (index) {
                final list = socialList[index];
                return IconButton(
                  onPressed: () async {
                    AppData.applyHapticFeedback();
                    return await Utils.launchURL("${list.link}");
                  },
                  iconSize: 50,
                  icon: Image.asset(list.asset),
                );
              }),
            ),
          ),
        ),
        CustomText(
          "app_copyrights".tr,
          fontSize: 13,
          padding: const EdgeInsets.symmetric(vertical: 5.0),
        ),
        CustomText.subtitle(
          "app_description".tr,
          fontSize: 12,
          textAlign: TextAlign.center,
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 40),
        ),
      ],
    );
  }
}
