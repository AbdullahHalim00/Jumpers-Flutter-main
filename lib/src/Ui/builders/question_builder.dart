import 'package:flutter/material.dart';

import '../../Core/constants/colors/app_colors.dart';
import '../list_tiles/expandable_list_tile.dart';
import '../text/custom_text.dart';

class QuestionBuilder extends StatelessWidget {
  final String question;
  final String answer;

  const QuestionBuilder({
    Key? key,
    required this.question,
    required this.answer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (AppColors.containerBCGWhite),
        border: Border.all(
          color: (AppColors.containerBorder),
          width: .5,
        ),
      ),
      padding: const EdgeInsets.all(10.0),
      child: ExpandableListTile(
        label: question,
        expandIcon: Icons.add,
        collapseIcon: Icons.minimize,
        primaryColor: AppColors.primDarker,
        iconsSize: 18.0,
        child: CustomText.subtitle(
          answer,
          fontSize: 13,
          padding: const EdgeInsetsDirectional.only(end: 15.0, top: 10),
        ),
      ),
    );
  }
}
