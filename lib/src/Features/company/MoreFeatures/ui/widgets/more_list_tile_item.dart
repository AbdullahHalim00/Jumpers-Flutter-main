part of 'imports_widgets_company_more.dart';

class MoreListTile extends StatelessWidget {
  final String leadingImage;
  final String title;
  final GestureTapCallback? onPressed;
  final Widget? trailing;

  final bool? defaultSwitchValue;
  final double? leadingImageScale;

  final ValueChanged<bool>? onSwitchValueChanged;

  const MoreListTile({
    Key? key,
    required this.leadingImage,
    this.title = "",
    this.onPressed,
    this.defaultSwitchValue,
    this.onSwitchValueChanged,
    this.trailing,
    this.leadingImageScale = 3.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultListTile(
      padding: AppInsets.defaultScreenALL,
      leadingImageScale: leadingImageScale,
      leadingImage: leadingImage,
      title: title,
      onPressed: onPressed,
      isTralilingExpanded: false,
      leadingColor: AppColors.containerBCGGrey,
      trailing: trailing ?? const SimpleArrowWidget(),
    );
  }
}
