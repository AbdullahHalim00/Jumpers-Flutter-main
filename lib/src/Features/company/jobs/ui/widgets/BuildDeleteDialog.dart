part of 'imports_widgets_job_screen.dart';

class BuildDeleteDialog extends StatelessWidget {
  final VoidCallback onAccept;

  const BuildDeleteDialog({Key? key, required this.onAccept}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomText(
          "delete_job",
          padding: EdgeInsets.only(top: 20.h),
          fontWeight: FW.semiBold,
          fontSize: 14,
        ),
        LottieBuilder.asset(
          Assets.lottie_delete,
          height: 200.h,
          repeat: false,
        ),
        YSpace.erinYeager,
        // YSpace.normal,
        Row(
          children: [
            Expanded(
              child: CustomOutlinedButton(
                height: 40.h,
                child: const CustomText(
                  "yes_sure",
                  fontSize: 11,
                  fontWeight: FW.semiBold,
                  color: AppColors.white,
                ),
                isCurvedBorders: true,
                primaryColor: AppColors.secondary,
                backgroundColor: AppColors.secondary,
                onPressed: onAccept,
              ),
            ),
            XSpace.hard,
            Expanded(
              child: CustomOutlinedButton(
                height: 40.h,
                child: const CustomText(
                  "back",
                  fontSize: 11,
                  fontWeight: FW.semiBold,
                  color: AppColors.black,
                ),
                isCurvedBorders: true,
                primaryColor: AppColors.secondary,
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
