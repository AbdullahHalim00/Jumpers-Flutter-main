part of 'imports_widgets_job_screen.dart';

class ReviewingJobsBuilder extends StatelessWidget {
  const ReviewingJobsBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FetchMyJobsController>(builder: (_) {
      return DataStatusBuilder(
        status: _.dataState,
        onDoneBuild: ConditionalBuilder(
          condition: _.reviewingJobs.isNotEmpty,
          onBuild: AnimatedWrapper(
            index: _.reviewingJobs.length,
            child: ListView.builder(
              shrinkWrap: true,
              physics: AppPhysics.neverScrollable,
              itemCount: _.reviewingJobs.length,
              itemBuilder: (context, index) {
                final job = _.reviewingJobs[index];
                return JobApplicationCard(
                  job: job,
                  onRemovePressed: () => _.deleteJobRequest(job.id),
                  // onRemovePressed: () {},
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
