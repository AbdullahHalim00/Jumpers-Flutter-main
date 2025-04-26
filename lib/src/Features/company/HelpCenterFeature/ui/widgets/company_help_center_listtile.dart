part of 'Widgets_company_help_center_imports.dart';

/// change the locale

class CompanyHelpCenterListTile extends StatelessWidget {
  final String leadingImage;
  final String title;
  final GestureTapCallback? onPressed;
  final bool isDark;

  const CompanyHelpCenterListTile({
    Key? key,
    required this.leadingImage,
    this.title = "",
    this.onPressed,
    this.isDark = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultListTile(
      leadingImage: leadingImage,
      leadingColor: AppColors.mainPrimBCGLight,
      leadingBorderColor: AppColors.primary,
      title: title,
      onPressed: onPressed,
      trailing: const Icon(
        Icons.arrow_back_ios,
        size: 15.0,
        textDirection: 0 == 0 ? TextDirection.ltr : TextDirection.rtl,
      ),
    );
  }
}
