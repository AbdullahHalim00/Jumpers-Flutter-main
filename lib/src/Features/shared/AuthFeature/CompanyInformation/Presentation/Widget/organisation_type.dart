import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CompanyInformation/Logic/organisation_info_controller.dart';
import 'package:jumper/src/Features/shared/AuthFeature/JumperInformation/presentation/Widget/card_choice_widget.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

class OrganisationType extends StatelessWidget {
  final OrganisationController controller;

  const OrganisationType({
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
          const CustomRText('نوع المؤسسة'),
          12.ESH(),
          SizedBox(
            height: 54.h,
            width: double.infinity,
            child: Row(
              children: [
                CardChoiceWidget(
                  onTap: () {
                    if (controller.organisationTypeId == 1) {
                      controller.setOrganisationTypeId(0);
                    }
                  },
                  isSelected: controller.organisationTypeId == 0,
                  title: 'company',
                  icon: "assets/icons/companyIcon.png",
                ),
                16.ESW(),
                CardChoiceWidget(
                  onTap: () {
                    if (controller.organisationTypeId == 0) {
                      controller.setOrganisationTypeId(1);
                    }
                  },
                  isSelected: controller.organisationTypeId == 1,
                  title: 'CEO',
                  icon: "assets/icons/CEOIcon.png",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
