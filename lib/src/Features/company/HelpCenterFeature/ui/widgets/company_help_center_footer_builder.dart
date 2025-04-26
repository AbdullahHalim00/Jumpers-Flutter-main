part of 'Widgets_company_help_center_imports.dart';

class CompanyHelpCenterFooterBuilder extends StatelessWidget {
  final CompanyHelpCenterController controller;

  const CompanyHelpCenterFooterBuilder(this.controller, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      hasBorder: false,
      child: Column(
        children: [
          AppLogo.versionBuilder(
            versionNum: "1.1.2",
          ),
          AppSocialBuilder(socialList: controller.socialData),
          const TermsAndPolicyButton(),
        ],
      ),
    );
  }
}
