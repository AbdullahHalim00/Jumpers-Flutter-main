part of 'import_widgets_j_home.dart';

class BuildVolunteerDialog extends StatelessWidget {
  const BuildVolunteerDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Assets.volunteer,
              height: 162.h,
              width: 148.w,
              fit: BoxFit.cover,
            ),
            33.0.ESH(),
            CustomText(
              "do_u_want_join_as_a_volunteer".tr,
              fontSize: 14,
              isBold: true,
            ),
            17.0.ESH(),
            CustomText.subtitle(
              "volunteering_info".tr,
              fontSize: 12,
              fontWeight: FW.light,
            ),
            33.0.ESH(),
            Row(
              children: [
                Expanded(
                  child: CustomRoundedButton(
                    height: 44.h,
                    backgroundColor: AppColors.secondary,
                    child: CustomText(
                      "see_more".tr,
                      color: AppColors.white,
                      fontSize: 12,
                    ),
                    onPressed: () {
                      Get.back();
                      Get.to(VolunteerScreen());
                    },
                  ),
                ),
                13.0.ESW(),
                Expanded(
                  child: CustomOutlinedButton(
                    height: 44.h,
                    isCurvedBorders: true,
                    backgroundColor: AppColors.containerBCGGrey,
                    primaryColor: AppColors.transparent,
                    child: Center(
                      child: CustomText(
                        "later".tr,
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
