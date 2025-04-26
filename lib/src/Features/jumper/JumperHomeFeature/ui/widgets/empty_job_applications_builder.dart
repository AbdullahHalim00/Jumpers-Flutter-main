part of 'import_widgets_j_home.dart';

class EmptyJobApplicationsBuilder extends StatelessWidget {
  const EmptyJobApplicationsBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyPageBuilder(
      imageUrl: Assets.empty_job_applications,
      title: "jobs_empty".tr,
      body: "no_job_applications_yet".tr,
      // customButton: Padding(
      //   padding: EdgeInsets.symmetric(vertical: 32.0.h, horizontal: 80.w),
      //   child: GetBuilder<FetchMyJobsController>(
      //       builder: (logic) {
      //         return CustomOutlinedButton.image(
      //           onPressed: () {
      //             // logic.changeTabIndex(1);
      //             logic.addJob();
      //           },
      //           height: 44.h,
      //           label: "adding_job_application".tr,
      //           primaryColor: AppColors.primary,
      //           isCurvedBorders: true,
      //           image: const AssetImage(Assets.arrow_left_2),
      //
      //         );
      //       }),
      // ),
    );
  }
}
