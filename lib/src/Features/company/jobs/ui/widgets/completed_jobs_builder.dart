part of 'imports_widgets_job_screen.dart';

class CompletedJobsBuilder extends StatelessWidget {
  const CompletedJobsBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FetchMyJobsController>(builder: (_) {
      return DataStatusBuilder(
        status: _.dataState,
        onDoneBuild: ConditionalBuilder(
          condition: _.completedJobs.isNotEmpty,
          onBuild: AnimatedWrapper(
            index: _.completedJobs.length,
            child: ListView.builder(
              shrinkWrap: true,
              physics: AppPhysics.neverScrollable,
              itemCount: _.completedJobs.length,
              itemBuilder: (context, index) {
                final job = _.completedJobs[index];
                return JobApplicationCard(
                  job: job,
                  onRemovePressed: () {},
                );
              },
            ),
          ),
          onFeedBack: const EmptyJobApplicationsScreen(),
        ),
        onLoadingBuild: const LoadingBox(),
      );
    });
  }
}
