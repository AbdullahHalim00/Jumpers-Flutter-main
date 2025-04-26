part of 'imports_widgets_job_screen.dart';

class UnderwayJobsBuilder extends StatelessWidget {
  const UnderwayJobsBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FetchMyJobsController>(builder: (_) {
      return DataStatusBuilder(
        status: _.dataState,
        onDoneBuild: ConditionalBuilder(
          condition: _.underwayJobs.isNotEmpty,
          onBuild: AnimatedWrapper(
            index: _.underwayJobs.length,
            child: ListView.builder(
              physics: AppPhysics.alwaysScrollablePhysics,
              itemCount: _.underwayJobs.length,
              itemBuilder: (context, index) {
                final job = _.underwayJobs[index];
                return JobApplicationCard(
                  job: job,
                  onRemovePressed: () {},
                );
              },
            ),
          ),
          onFeedBack: const EmptyJobUnderWayScreen(),
        ),
        onLoadingBuild: const LoadingBox(),
      );
    });
  }
}
