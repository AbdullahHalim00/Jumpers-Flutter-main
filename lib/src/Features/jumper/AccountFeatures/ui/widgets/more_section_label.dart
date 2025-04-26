part of 'imports_widgets_company_more.dart';

class MoreSectionLabel extends StatelessWidget {
  final String label;

  const MoreSectionLabel({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomText.subtitle(
      label,
      padding: AppInsets.defaultScreenALL,
      fontSize: 14,
      fontWeight: FW.regular,
    );
  }
}
