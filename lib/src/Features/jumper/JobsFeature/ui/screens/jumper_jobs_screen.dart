part of 'jumper_jobs_imports.dart';

class JumperJobsScreen extends StatelessWidget {
  const JumperJobsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final JumperJobsController _jumperJobsController = Get.find();
    return Scaffold(
      appBar: JumperBasicAppbar(title: "job_applications".tr),
      body: GetBuilder<JumperJobsController>(
          init: _jumperJobsController,
          builder: (logic) {
            return Padding(
              padding: AppInsets.defaultScreenALL,
              child: AndroidOnRefresh(
                onRefresh: () async {
                  await logic.fetchJobs();
                },
                child: CustomListView(
                  children: [
                    logic.isEmployeeTabEmpty
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: const Center(
                              child: EmptyCurrentJobsBuilder(),
                            ),
                          )
                        : Column(
                            children: [
                              JumperAcceptedJobBuilder(
                                type: 2,
                              ),
                              // JumperJobOffersBuilder(),
                            ],
                          ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
