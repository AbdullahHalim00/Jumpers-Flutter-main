part of 'imports_widgets_map_screen.dart';

class LocationButton extends StatelessWidget {
  final VoidCallback onTap;

  const LocationButton({required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapController>(builder: (logic) {
      return DefaultContainer(
        color: AppColors.white.withOpacity(0.8),
        padding: AppInsets.defaultScreenALL,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Image.asset(
                  Assets.location,
                  height: 50.h,
                  width: 50.h,
                ),
                XSpace.hard,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        "${logic.address}",
                        isOverFlow: true,
                      ),
                      YSpace.light,
                      CustomText.subtitle(
                        "${logic.detailedAddress}",
                        fontWeight: FW.regular,
                        fontSize: 13,
                        isOverFlow: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            32.0.ESH(),
            CustomRoundedButton(
              backgroundColor: AppColors.secondary,
              child: CustomText(
                "save".tr,
                color: AppColors.white,
              ),
              onPressed: onTap,
            ),
          ],
        ),
      );
    });
  }
}
