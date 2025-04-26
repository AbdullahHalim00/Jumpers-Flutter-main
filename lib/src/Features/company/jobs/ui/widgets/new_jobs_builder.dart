part of 'imports_widgets_job_screen.dart';

class NewJobsBuilder extends StatelessWidget {
  const NewJobsBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FetchMyJobsController>(builder: (_) {
      return DataStatusBuilder(
        status: _.dataState,
        onDoneBuild: ConditionalBuilder(
          condition: _.newJobs.isNotEmpty,
          onBuild: AnimatedWrapper(
            index: _.newJobs.length,
            child: CustomListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                const NewJobsHeaderText(),
                ListView.builder(
                  physics: AppPhysics.neverScrollable,
                  shrinkWrap: true,
                  itemCount: _.newJobs.length,
                  itemBuilder: (context, index) {
                    final job = _.newJobs[index];
                    return JobApplicationCard(
                      job: job,
                      onRemovePressed: () {},
                    );
                  },
                ),
              ],
            ),
          ),
          onFeedBack: const EmptyJobApplicationsScreen(),
        ),
        onLoadingBuild: const LoadingBox(),
      );
    });
  }
}
