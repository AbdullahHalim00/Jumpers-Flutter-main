part of 'imports_widgets_service_details.dart';

class ServiceDetailTile extends StatelessWidget {
  final String? label;

  final String? img;

  final String? data;

  const ServiceDetailTile({Key? key, this.label, this.img, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultListTile(
      padding: AppInsets.defaultScreenALL,
      title: "$label",
      titleFW: FW.light,
      leadingColor: AppColors.transparent,
      leadingImageScale: 4,
      titleSize: 14,
      leadingImage: "$img",
      trailing: (data != "")
          ? CustomText(
              "$data",
              fontSize: 14,
              fontWeight: FW.medium,
              textAlign: TextAlign.end,
              isOverFlow: true,
            )
          : null,
    );
  }
}
