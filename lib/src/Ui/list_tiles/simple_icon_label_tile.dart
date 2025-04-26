import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumper/src/Ui/spaces_and_dividers/spaces.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

class SimpleIconLabelTile extends StatelessWidget {
  final String imageUrl;

  final String label;

  const SimpleIconLabelTile({
    Key? key,
    required this.label,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          imageUrl,
          height: 20.h,
          width: 20.h,
        ),
        XSpace.light,
        CustomText.subtitle(
          label,
          fontWeight: FW.light,
          fontSize: 11,
        ),
      ],
    );
  }
}
