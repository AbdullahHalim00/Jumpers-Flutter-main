import 'package:flutter/material.dart';
import 'package:jumper/src/Ui/spaces_and_dividers/spaces.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

class SimpleInfoTile extends StatelessWidget {
  final String? label;

  final String? data;

  const SimpleInfoTile({Key? key, this.label, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText.subtitle(
          "$label : ",
          fontSize: 11,
          fontWeight: FW.light,
        ),
        XSpace.light,
        CustomText.subtitle(
          "$data",
          fontSize: 11,
          fontWeight: FW.light,
        ),
      ],
    );
  }
}
