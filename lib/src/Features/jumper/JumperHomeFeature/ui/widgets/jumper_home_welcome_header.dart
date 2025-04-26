part of 'import_widgets_j_home.dart';

class JumperHomeWelcomeHeader extends StatelessWidget {
  const JumperHomeWelcomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          Assets.stars,
          height: 18.h,
          width: 14.w,
        ),
        7.0.ESW(),
        CustomText.header(
          "see_latest_services".tr,
          isBold: true,
        ),
      ],
    );
  }
}
