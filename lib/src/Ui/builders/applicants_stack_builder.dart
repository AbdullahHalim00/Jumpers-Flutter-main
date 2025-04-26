import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumper/src/Bloc/models/applicants_model.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';
import 'package:jumper/src/Ui/builders/conditional_builder.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

class ApplicantsStackBuilder extends StatelessWidget {
  final List<ApplicantsModel> applicants;

  const ApplicantsStackBuilder({
    Key? key,
    required this.applicants,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        for (int i = 0; i < applicants.length; i++)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: (25 * i + 1).w),
            child: _ApplicantsCircledAvatar(
              imageUrl: applicants[i].image,
              name: applicants[i].name,
            ),
          ),
        if (applicants.length > 3)
          Tooltip(
            message: applicants.map((e) => e.name).toList().join('\n,'),
            child: Scrollbar(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.w),
                child: _ApplicantsCircledAvatar(
                  showNumber: applicants.length - 3 > 0,
                  usersNumber: applicants.length - 3,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _ApplicantsCircledAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? name;

  final bool showNumber;
  final int? usersNumber;

  const _ApplicantsCircledAvatar({
    Key? key,
    this.imageUrl,
    this.showNumber = false,
    this.usersNumber,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Tooltip(
        message: name ?? "",
        child: CircleAvatar(
          radius: 22.r,
          backgroundColor: AppColors.white,
          child: ConditionalBuilder(
            condition: showNumber,
            onBuild: CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.black,
                child: CustomText(
                  "$usersNumber" " +",
                  fontSize: 11,
                  fontWeight: FW.medium,
                  color: AppColors.white,
                )),
            onFeedBack: CircleAvatar(
              radius: 20.r,
              backgroundImage: NetworkImage(
                imageUrl != "" ? "$imageUrl" : Assets.networkKDefaultUser,
              ),
            ),
          ),
        ),
      );
    });
  }
}
