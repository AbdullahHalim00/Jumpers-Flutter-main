part of 'imports_widgets_job_screen.dart';

/// ..
class AllJobsBuilder extends StatelessWidget {
  const AllJobsBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FetchMyJobsController>(builder: (_) {
      return DataStatusBuilder(
        status: _.dataState,
        onDoneBuild: ConditionalBuilder(
          condition: _.allJobs.isNotEmpty,
          onBuild: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => 0.0.ESH(),
            physics: AppPhysics.neverScrollable,
            itemCount: _.allJobs.length,
            // itemCount: 200,
            itemBuilder: (context, index) {
              // final job = _.allJobs[index];
              // printDM("_.allJobs.length${_.allJobs.length}", );
              return
                  // Text('data');
                  JobApplicationCard(
                job: _.allJobs[index],
                onRemovePressed: () => _.deleteJobRequest(_.allJobs[index].id),
              );
            },
          ),
          onFeedBack: const EmptyJobApplicationsScreen(),
        ),
        onLoadingBuild: const LoadingBox(),
      );
    });
  }
}
