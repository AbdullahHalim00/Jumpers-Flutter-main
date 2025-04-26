part of 'import_widgets_j_home.dart';

class JumperHomeJobApplicationsBuilder extends StatelessWidget {
  const JumperHomeJobApplicationsBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.put(FetchMyJobsController());
    return GetBuilder<JumperJobsController>(builder: (_) {
      return DataStatusBuilder(
        status: _.dataState,
        // onDone: GetBuilder<JumperHomeController>(builder: (_) {
        onDoneBuild:
            GetBuilder<JumperHomeController>(builder: (homeController) {
          return ConditionalBuilder(
            condition: _.jobs.isNotEmpty,
            // list not empty as an example
            onBuild: Column(
              children: [
                // MainSectionButton(
                //   label: "new_job_apps_offers".tr,
                //   trailing: "show_all".tr,
                //   onPressed: () => homeController.showAllJobAppsReq(),
                // ),
                AnimatedWrapper(
                  index: _.jobs.length,
                  child: ListView.builder(
                    physics: AppPhysics.neverScrollable,
                    shrinkWrap: true,
                    itemCount: _.jobs.length,
                    itemBuilder: (context, index) {
                      final JumperJob job = _.jobs
                          .getRange(0, (_.jobs.length > 2 ? 2 : _.jobs.length))
                          .toList()[index];
                      return JumperJobOfferCard(
                        job: job,
                      );
                    },
                  ),
                ),
              ],
            ),
            onFeedBack: SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: const EmptyJobApplicationsBuilder(),
            ),
          );
        }),
        onLoadingBuild: const LoadingBox(
          heightRatio: 0.3,
        ),
        onRedirectCallback: () async {
          await _.fetchJobs();
        },
      );
    });
  }
}
