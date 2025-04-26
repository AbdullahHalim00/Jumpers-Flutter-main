part of 'imports_widgets_jumper_jobs.dart';

class JumperAcceptedJobBuilder extends StatelessWidget {
  /// type == 1  --> All Jobs
  /// type == 2  --> Current Jobs

  int? type;

  JumperAcceptedJobBuilder({Key? key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JumperJobsController>(builder: (_) {
      return DataStatusBuilder(
        status: _.dataState,
        onDoneBuild: ConditionalBuilder(
          condition: type == 2
              ? _.myCurrentJobs.isNotEmpty
              : _.allMyJobs.isNotEmpty, // list not empty as an example
          onBuild: Column(
            children: [
              MainSectionButton(
                margin: EdgeInsets.symmetric(vertical: 10.h),
                label: "current_new_jobs".tr,
              ),
              AnimatedWrapper(
                index: type == 2 ? _.myCurrentJobs.length : _.allMyJobs.length,
                child: ListView.builder(
                  physics: AppPhysics.neverScrollable,
                  shrinkWrap: true,
                  itemCount:
                      type == 2 ? _.myCurrentJobs.length : _.allMyJobs.length,
                  itemBuilder: (context, index) {
                    final JumperJob job =
                        type == 2 ? _.myCurrentJobs[index] : _.allMyJobs[index];
                    return JumperAcceptedJobCard(
                      job: job,
                    );
                  },
                ),
              ),
            ],
          ),
          onFeedBack: const EmptyJobApplicationsBuilder(),
        ),
        onLoadingBuild: const LoadingBox(
          heightRatio: 0.3,
        ),
      );
    });
  }
}
