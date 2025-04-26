part of 'imports_manage_work.dart';

class ManageWorkScreen extends StatelessWidget {
  const ManageWorkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ManageWorkController());
    JumperJobsController _jumperJobsController = Get.find();
    return Scaffold(
      appBar: JumperBasicAppbar(title: "manage_work".tr),
      body: GetBuilder<ManageWorkController>(builder: (logic) {
        return GetBuilder<JumperJobsController>(builder: (_) {
          return AndroidOnRefresh(
            onRefresh: () async {
              await _jumperJobsController.fetchJobs();
            },
            child: CustomListView(
              children: [
                DataStatusBuilder(
                  // status: _.status,
                  status: _.dataState,
                  onDoneBuild: ConditionalBuilder(
                    condition: _.myJobs.isNotEmpty,
                    onBuild: const ManageWorkBody(),
                    onFeedBack: SizedBox(
                      height: MediaQuery.of(context).size.height - 56.h,
                      child: const EmptyWorkBuilder(),
                    ),
                  ),
                  onLoadingBuild: const LoadingBox(heightRatio: 0.8),
                  onRedirectCallback: () {
                    _jumperJobsController.fetchJobs();
                  },
                ),
              ],
            ),
          );
        });
      }),
    );
  }
}
