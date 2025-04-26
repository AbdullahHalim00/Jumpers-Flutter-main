part of 'imports_widgets_job_screen.dart';

class UnCompletedJobsBuilder extends StatelessWidget {
  const UnCompletedJobsBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FetchMyJobsController>(builder: (_) {
      return DataStatusBuilder(
        status: _.dataState,
        onDoneBuild: ConditionalBuilder(
          condition: _.unCompletedJobs.isNotEmpty,
          onBuild: AnimatedWrapper(
            index: _.unCompletedJobs.length,
            child: ListView.builder(
              shrinkWrap: true,
              physics: AppPhysics.neverScrollable,
              itemCount: _.unCompletedJobs.length,
              itemBuilder: (context, index) {
                final job = _.unCompletedJobs[index];
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
