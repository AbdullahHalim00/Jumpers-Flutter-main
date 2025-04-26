import 'package:flutter/material.dart';
import 'package:jumper/src/Core/constants/decorations/app_Insets.dart';

import '../containers/default_container.dart';
import '../text/custom_text.dart';

class AboutUsBuilder extends StatelessWidget {
  final String? headLabel;
  final String? headBody;

  const AboutUsBuilder({
    Key? key,
    this.headLabel,
    this.headBody,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      padding: AppInsets.defaultScreenALL,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            headLabel ?? "add label",
            isBold: true,
            isUpperCase: true,
            padding: const EdgeInsetsDirectional.only(end: 15.0, top: 10),
          ),
          CustomText.subtitle(
            headBody ?? "add body",
            fontSize: 14,
            padding: const EdgeInsetsDirectional.only(end: 15.0, top: 10),
          ),
        ],
      ),
    );
  }
}
