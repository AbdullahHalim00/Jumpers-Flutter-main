part of 'imports_widgets_job_screen.dart';

class CanceledJobsBuilder extends StatelessWidget {
  const CanceledJobsBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FetchMyJobsController>(builder: (_) {
      return DataStatusBuilder(
        status: _.dataState,
        onDoneBuild: ConditionalBuilder(
          condition: _.canceledJobs.isNotEmpty,
          onBuild: AnimatedWrapper(
            index: _.canceledJobs.length,
            child: ListView.builder(
              shrinkWrap: true,
              physics: AppPhysics.neverScrollable,
              itemCount: _.canceledJobs.length,
              itemBuilder: (context, index) {
                final job = _.canceledJobs[index];
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
