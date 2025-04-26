part of 'imports_widget_create_new_application.dart';

class BuildSaveJobToPendedDialog extends StatelessWidget {
  const BuildSaveJobToPendedDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    Assets.empty_applications,
                    height: 162.h,
                    width: 162.w,
                    fit: BoxFit.cover,
                  ),
                  33.0.ESH(),
                  CustomText(
                    "pended_jobs".tr,
                    fontSize: 14,
                    isBold: true,
                  ),
                  17.0.ESH(),
                  CustomText.subtitle(
                    "pended_jobs_details".tr,
                    fontSize: 12,
                    fontWeight: FW.light,
                  ),
                  33.0.ESH(),
                ],
              ),
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
