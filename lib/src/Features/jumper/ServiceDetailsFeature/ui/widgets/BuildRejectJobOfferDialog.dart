part of 'imports_widgets_service_details.dart';

class BuildRejectJobOfferDialog extends StatelessWidget {
  final VoidCallback? onReject;

  const BuildRejectJobOfferDialog({Key? key, this.onReject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Assets.reject_offer,
              height: 162.h,
              width: 171.w,
              fit: BoxFit.cover,
            ),
            19.0.ESH(),
            CustomText(
              "confirm_reject_offer".tr,
              fontSize: 14,
              isBold: true,
            ),
            16.0.ESH(),
            CustomText.subtitle(
              "confirm_reject_offer_details".tr,
              fontSize: 12,
              fontWeight: FW.light,
            ),
            57.0.ESH(),
            Row(
              children: [
                Expanded(
                  child: CustomRoundedButton(
                    height: 44.h,
                    backgroundColor: AppColors.secondary,
                    child: CustomText(
                      "yes_sure".tr,
                      color: AppColors.white,
                      fontSize: 12,
                    ),
                    onPressed: onReject,
                  ),
                ),
                16.0.ESW(),
                Expanded(
                  child: CustomOutlinedButton(
                    height: 44.h,
                    isCurvedBorders: true,
                    backgroundColor: AppColors.containerBCGGrey,
                    primaryColor: AppColors.transparent,
                    child: Center(
                      child: CustomText(
                        "backing_down".tr,
                        fontSize: 12,
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        CustomIconAvatar(
          imageUrl: Assets.close,
          onTap: () {
            Get.back();
          },
        ),
      ],
    );
  }
}
