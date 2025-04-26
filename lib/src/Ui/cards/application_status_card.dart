import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

import 'job_application_card.dart';

class ApplicationStatusCard extends StatelessWidget {
  final ApplicationStatus status;

  ///given manually
  final String? label;

  final Color? color;

  final Color? labelColor;

  const ApplicationStatusCard({
    Key? key,
    this.status = ApplicationStatus.newRequest,
    this.label,
    this.color,
    this.labelColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final data = model(status);
      return Container(
        height: 27.h,
        padding: EdgeInsets.all(5.0.w),
        decoration: BoxDecoration(
          color: color ?? data.color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: CustomText.subtitle(
          label ?? data.label,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          fontSize: 9,
          color: labelColor ?? data.labelColor,
        ),
      );
    });
  }
}

class ApplicationCardModel {
  String label;

  Color labelColor;

  Color color;

  ApplicationCardModel._(
    this.label,
    this.labelColor,
    this.color,
  );
}

ApplicationCardModel model(ApplicationStatus status) {
  switch (status) {
    case ApplicationStatus.newRequest:
      return ApplicationCardModel._(
        "request_new".tr,
        const Color(0xffBF8C6D),
        const Color(0xffFAF6F3),
      );
    case ApplicationStatus.pending:
      return ApplicationCardModel._(
        "request_pending".tr,
        const Color(0xffC1C55D),
        const Color(0xffFAFBF2),
      );

    case ApplicationStatus.reviewing:
      return ApplicationCardModel._(
        "reviewing".tr,
        const Color(0xff1B312E),
        const Color(0xffEDEFEE),
      );
    case ApplicationStatus.uncompleted:
      return ApplicationCardModel._(
        "uncompleted".tr,
        const Color(0xff000000),
        const Color(0xffEDEFEE),
      );
    case ApplicationStatus.underWay:
      return ApplicationCardModel._(
        "underway".tr,
        const Color(0xff5D84C5),
        const Color(0xffF2F5FB),
      );

    case ApplicationStatus.completed:
      return ApplicationCardModel._(
        "completed".tr,
        const Color(0xff26A565),
        const Color(0xffEEF8F3),
      );

    case ApplicationStatus.canceled:
      return ApplicationCardModel._(
        "canceled".tr,
        const Color(0xffEC5555),
        const Color(0xffFEF1F1),
      );

    default:
      return ApplicationCardModel._(
        "request_new".tr,
        const Color(0xffBF8C6D),
        const Color(0xffFAF6F3),
      );
  }
}
