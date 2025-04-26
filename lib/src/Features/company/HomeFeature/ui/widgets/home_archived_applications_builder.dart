part of 'imports_widgets_home_screen.dart';

class CompanyHomeArchivedApplicationsBuilder extends StatelessWidget {
  const CompanyHomeArchivedApplicationsBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RequestStatusBuilder(
      status: RequestStatus.done,
      onDone: GetBuilder<CompanyHomeController>(builder: (_) {
        return Visibility(
          visible: _.isArchivedSectionVisible,
          replacement: _.showAnimation
              ? LottieBuilder.asset(
                  Assets.lottie_burst,
                  repeat: false,
                )
              : const SizedBox(),
          child: ConditionalBuilder(
            condition: 1 == 1, // list not empty as an example
            onBuild: Column(
              children: [
                MainSectionButton(
                  label: "archived_job_applications".tr,
                  trailing: "hide".tr,
                  onPressed: () => _.hideArchivedApplicationSection(),
                ),
                GetBuilder<FetchMyJobsController>(
                    // init: FetchMyJobsController(),
                    builder: (logic) {
                  return DataStatusBuilder(
                    status: logic.dataState,
                    onDoneBuild: ConditionalBuilder(
                      condition: logic.pendingJobs.isNotEmpty,
                      onBuild: AnimatedWrapper(
                        index: logic.pendingJobs.length,
                        child: ListView.builder(
                          physics: AppPhysics.neverScrollable,
                          shrinkWrap: true,
                          itemCount: logic.pendingJobs.length,
                          itemBuilder: (context, index) {
                            final job = logic.pendingJobs[index];
                            return JobApplicationCard(
                              job: job,
                              onRemovePressed: () {
                                logic.deleteJobRequest(job.id);
                              },
                            );
                          },
                        ),
                      ),
                      onFeedBack: const EmptyJobApplicationsBuilder(),
                    ),
                    onLoadingBuild: const LoadingBox(),
                  );
                }),
              ],
            ),
            onFeedBack: const EmptyJobApplicationsBuilder(),
          ),
        );
      }),
      onLoading: const LoadingBox(
        heightRatio: 0.3,
      ),
    );
  }
}
