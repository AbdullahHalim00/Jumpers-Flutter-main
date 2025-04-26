part of 'imports_widgets_home_screen.dart';

class CompanyHomeStaticsBuilder extends StatelessWidget {
  const CompanyHomeStaticsBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.put(CompanyStaticsController());
    return GetBuilder<CompanyStaticsController>(builder: (_) {
      return DataStatusBuilder(
        status: _.dataState,
        onDoneBuild: AnimatedWrapper(
          index: 3,
          child: GridView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 3.h / 2.h,
              crossAxisCount: 2,
              // childAspectRatio: 2.3.h,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 15.h,
              // mainAxisExtent: 80.h,
            ),
            children: [
              CompanyStatisticCard(
                label: "total_jobs".tr,
                labelDescription: "request".tr,
                requestNumber: _.dataState.data?.allJobs ?? 0,
                color: const Color(0xffA86547),
                imgUrl: Assets.total_jobs,
              ),
              CompanyStatisticCard(
                label: "jobs_completed".tr,
                labelDescription: "request".tr,
                requestNumber: _.dataState.data?.completedJobs ?? 0,
                color: const Color(0xff20CD8F),
                imgUrl: Assets.running_jobs,
              ),
              CompanyStatisticCard(
                label: "jobs_under_review".tr,
                labelDescription: "request".tr,
                requestNumber: _.dataState.data?.underReviewJobs ?? 0,
                color: const Color(0xffFD7753),
                imgUrl: Assets.reviewing_jobs,
              ),
              CompanyStatisticCard(
                label: "jobs_underway".tr,
                labelDescription: "request".tr,
                requestNumber: _.dataState.data?.currentJobs ?? 0,
                color: const Color(0xff6B20CD),
                imgUrl: Assets.running_jobs,
              ),
              CompanyStatisticCard(
                label: "employees".tr,
                labelDescription: "single_employee".tr,
                requestNumber: 5,
                color: const Color(0xff5386FD),
                imgUrl: Assets.running_jobs,
              ),
            ],
          ),
        ),
        onLoadingBuild: LoadingBox(
          heightRatio: 0.4.h,
        ),
      );
    });
  }
}
