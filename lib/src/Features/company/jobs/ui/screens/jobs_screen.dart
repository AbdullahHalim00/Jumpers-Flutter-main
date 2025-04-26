part of 'imports_jobs_screen.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FetchMyJobsController());

    return GetBuilder<FetchMyJobsController>(builder: (_) {
      return Scaffold(
        floatingActionButton: const JobsFAB(),
        appBar: AppBars.jobs(
          dropDownTitle: Text(
            "underway".tr,
            style: TextStyle(fontFamily: "Somar"),
          ),
        ),
        body: AndroidOnRefresh(
          onRefresh: () async {
            final FetchMyJobsController jobEmployeesController = Get.find();
            await jobEmployeesController.fetchJobs();
          },
          child: Padding(
            padding: AppInsets.defaultScreenALL,
            child: IndexedStack(
              index: 0,
              children: const [
                // SizedBox.shrink(),
                // AllJobsBuilder(),

                // NewJobsBuilder(),
                // PendingJobsBuilder(),
                // ReviewingJobsBuilder(),
                // UnCompletedJobsBuilder(),
                UnderwayJobsBuilder(),
                // CompletedJobsBuilder(),
                // CanceledJobsBuilder(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
//
