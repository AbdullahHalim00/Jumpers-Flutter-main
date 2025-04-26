part of 'imports_widgets_home_screen.dart';

class EmptyArchivedApplicationsBuilder extends StatelessWidget {
  const EmptyArchivedApplicationsBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyPageBuilder(
      imageUrl: Assets.empty_applications,
      title: "no_job_applications_yet".tr,
      body: "add_job_application_to_ur_organization".tr,
      customButton: Container(
        margin: EdgeInsets.only(
          top: 32.h,
        ),
        child: CustomOutlinedButton(
          primaryColor: AppColors.primary,
          width: 165.w,
          child: Row(
            children: [
              Expanded(
                child: CustomText(
                  "add_job_application".tr,
                  color: AppColors.primary,
                  fontSize: 12,
                ),
              ),
              Icon(
                Icons.arrow_forward_rounded,
                size: 11.w,
                color: AppColors.primary,
              ),
            ],
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
