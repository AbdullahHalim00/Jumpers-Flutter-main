import 'package:flutter/material.dart';
import 'package:jumper/src/Ui/containers/default_container.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

/// used in [privacy] and [Terms] screens
class StaticTextItem extends StatelessWidget {
  final String title;
  final String body;

  const StaticTextItem({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: double.infinity,
      hasBorder: false,
      // height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            title,
            isBold: true,
            padding: const EdgeInsets.symmetric(vertical: 5.0),
          ),
          Expanded(
            child: ListView(
              children: [
                CustomText.subtitle(
                  body,
                  fontSize: 14,
                  fontWeight: FW.regular,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
