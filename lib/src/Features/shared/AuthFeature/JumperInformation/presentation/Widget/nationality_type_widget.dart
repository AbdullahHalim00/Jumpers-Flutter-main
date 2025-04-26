import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Features/shared/AuthFeature/JumperInformation/Logic/jumper_personal_info_controller.dart';
import 'package:jumper/src/Features/shared/AuthFeature/JumperInformation/presentation/Widget/card_choice_widget.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

class NationalityTypeWidget extends StatelessWidget {
  final JumperPersonalInfoController controller;

  const NationalityTypeWidget({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.ESH(),
          const CustomRText('nationality'),
          12.ESH(),
          SizedBox(
            height: 54.h,
            width: double.infinity,
            child: Row(
              children: [
                CardChoiceWidget(
                  onTap: () {
                    controller.setNationalityId(1);
                  },
                  isSelected: controller.nationalityId == 1,
                  title: 'saudi',
                ),
                16.ESW(),
                CardChoiceWidget(
                  onTap: () {
                    controller.setNationalityId(2);
                  },
                  isSelected: controller.nationalityId == 2,
                  title: 'non_saudi',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
