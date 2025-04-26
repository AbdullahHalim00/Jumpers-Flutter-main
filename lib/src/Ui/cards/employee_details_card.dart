import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumper/src/Ui/spaces_and_dividers/custom_divider.dart';

import '../../Core/constants/colors/app_colors.dart';
import '../spaces_and_dividers/spaces.dart';
import '../text/custom_text.dart';

class GeneralDetailsCard extends StatelessWidget {
  final String label;

  final Widget body;
  final bool isSectionDivider;
  final bool onTopDivider;

  const GeneralDetailsCard({
    Key? key,
    required this.label,
    required this.body,
    this.isSectionDivider = true,
    this.onTopDivider = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (onTopDivider)
            _Divider(
              isSectionDivider: isSectionDivider,
            ),
          CustomText.header(
            label,
          ),
          YSpace.normal,
          body,
          if (!onTopDivider)
            _Divider(
              isSectionDivider: isSectionDivider,
            ),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  final bool isSectionDivider;

  const _Divider({
    Key? key,
    this.isSectionDivider = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isSectionDivider
        ? Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            height: MediaQuery.of(context).size.height * 0.02,
            color: AppColors.containerBCGGrey,
          )
        : XDivider.semiFaded(verticalPadding: 5.h);
  }
}
