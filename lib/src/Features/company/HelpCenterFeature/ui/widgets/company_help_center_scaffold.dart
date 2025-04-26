part of 'Widgets_company_help_center_imports.dart';

class CompanyHelpCenterScaffold extends StatelessWidget {
  final Widget body;

  const CompanyHelpCenterScaffold({Key? key, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      padding: EdgeInsets.zero,
      scaffoldColor: AppColors.scafBCGGrey,
      appBarTitle: "help_center".tr,
      body: body,
    );
  }
}
