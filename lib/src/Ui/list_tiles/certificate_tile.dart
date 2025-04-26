import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';
import 'package:jumper/src/Ui/builders/conditional_builder.dart';
import 'package:jumper/src/Ui/circle_avatar/custom_icon_avatar.dart';
import 'package:jumper/src/Ui/spaces_and_dividers/spaces.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

class CertificateTile extends StatelessWidget {
  final String? text;
  final String? description;
  final String? grade;
  final String? image;
  final String defaultSectionImage;

  const CertificateTile({
    Key? key,
    this.text,
    this.description,
    this.image,
    this.grade,
    this.defaultSectionImage = Assets.teacher,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          ConditionalBuilder(
            condition: (image != null && image != ""),
            onBuild: CustomIconAvatar(
              avatarType: AvatarBorderType.outer,
              imageUrl: "$image",
              isNetworkImage: true,
            ),
            onFeedBack: CustomIconAvatar(
              avatarType: AvatarBorderType.outer,
              imageUrl: defaultSectionImage,
              isNetworkImage: false,
            ),
          ),
          XSpace.light,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                "$text",
                fontSize: 13,
              ),
              if (description != null || grade != null)
                CustomText.subtitle(
                  (description ?? "") + (grade != null ? "- $grade" : ""),
                  fontSize: 11,
                  fontWeight: FW.regular,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
