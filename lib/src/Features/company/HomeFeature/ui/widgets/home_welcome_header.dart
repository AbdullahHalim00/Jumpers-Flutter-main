part of 'imports_widgets_home_screen.dart';

class CompanyHomeWelcomeHeader extends StatelessWidget {
  const CompanyHomeWelcomeHeader({Key? key}) : super(key: key);

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
          "see_latest_organization_statistics".tr,
          isBold: true,
        ),
      ],
    );
  }
}
