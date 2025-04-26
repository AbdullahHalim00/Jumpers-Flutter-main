part of 'imports_widgets_job_screen.dart';

class PendingJobsBuilder extends StatelessWidget {
  const PendingJobsBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FetchMyJobsController>(builder: (_) {
      return DataStatusBuilder(
        status: _.dataState,
        onDoneBuild: ConditionalBuilder(
          condition: _.pendingJobs.isNotEmpty,
          onBuild: AnimatedWrapper(
            index: _.pendingJobs.length,
            child: ListView.builder(
              physics: AppPhysics.alwaysScrollablePhysics,
              itemCount: _.pendingJobs.length,
              itemBuilder: (context, index) {
                final job = _.pendingJobs[index];
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
