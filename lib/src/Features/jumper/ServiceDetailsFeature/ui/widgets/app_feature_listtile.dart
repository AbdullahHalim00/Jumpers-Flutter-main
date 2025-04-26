part of 'imports_widgets_service_details.dart';

class AppFeaturesListTile extends StatelessWidget {
  final String title;

  final String image;

  final String description;

  const AppFeaturesListTile({
    Key? key,
    required this.title,
    required this.image,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0.h),
      child: Column(
        children: [
          DefaultListTile(
            hasBorder: false,
            title: title,
            leadingImageScale: 3,
            leadingImage: image,
          ),
          CustomText.subtitle(
            description,
            padding: const EdgeInsetsDirectional.only(
              start: 40,
            ),
            fontSize: 11,
            fontWeight: FW.light,
          ),
        ],
      ),
    );
  }
}
