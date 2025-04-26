part of 'imports_widgets_manage_work.dart';

class ManageWorkCurrentJobsBuilder extends StatelessWidget {
  const ManageWorkCurrentJobsBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JumperJobsController>(builder: (_) {
      return DataStatusBuilder(
        status: _.dataState,
        onDoneBuild: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // upcoming reminder
            CustomText(
              "your_current_jobs".tr,
              fontSize: 14,
              fontWeight: FW.medium,
              padding: EdgeInsets.only(
                top: 32.h,
                bottom: 19.h,
              ),
            ),
            AnimatedWrapper(
              index: _.myJobs.length,
              child: ListView.builder(
                shrinkWrap: true,
                physics: AppPhysics.neverScrollable,
                itemCount: _.myJobs.length,
                itemBuilder: (context, index) {
                  final job = _.myJobs[index];
                  return CurrentJobsCard(
                    jobTitle: job.serviceTitle,
                    companyImage: job.companyImage,
                    companyName: job.companyName,
                    workStartTime: job.startTimeFormat.adN,
                    workEndTime: job.endTimeFormat.adN,
                    startedJobDate: job.publishedAt.adN,
                    onDetailsPressed: () {
                      Get.to(() => JumperJobDetailsScreen(
                            dataJumber: job,
                          ));
                    },
                  );
                },
              ),
            ),
          ],
        ),
        onLoadingBuild: LoadingBox(),
      );
    });
  }
}
