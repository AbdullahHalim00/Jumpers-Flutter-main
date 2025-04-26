part of 'imports_widgets_company_more.dart';

class _MoreListTile extends StatelessWidget {
  final String leadingImage;
  final String title;
  final GestureTapCallback? onPressed;
  final Widget? trailing;

  final bool? defaultSwitchValue;
  final double? leadingImageScale;

  final ValueChanged<bool>? onSwitchValueChanged;

  const _MoreListTile({
    Key? key,
    required this.leadingImage,
    this.title = "",
    this.onPressed,
    this.defaultSwitchValue,
    this.onSwitchValueChanged,
    this.trailing,
    this.leadingImageScale = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultListTile(
      padding: AppInsets.defaultScreenALL,
      leadingImageScale: leadingImageScale,
      leadingImage: leadingImage,
      title: title,
      onPressed: onPressed,
      leadingColor: AppColors.mainSecBCGLight,
      trailing: trailing ?? const SimpleArrowWidget(),
    );
  }
}
