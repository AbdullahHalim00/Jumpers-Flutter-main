part of 'imports_jumper_home_screen.dart';

class JumperHomeScreen extends StatelessWidget {
  const JumperHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JumperJobsController _jobsController = Get.find();

    return Scaffold(
      appBar: const JumperHomeAppBar(),
      body: Padding(
        padding: AppInsets.defaultScreenALL,
        child: AndroidOnRefresh(
          onRefresh: () async {
            await _jobsController.fetchJobs();
          },
          child: CustomListView(
            children: [
              const JumperHomeWelcomeHeader(),
              25.0.ESH(),
              MainSectionButton(
                margin: EdgeInsets.symmetric(vertical: 10.h),
                label: "current_offers".tr,
              ),
              const JumperHomeJobApplicationsBuilder(),
              // const JumperHomeLatestActivityBuilder(),
              20.0.ESH(),
              JumperAcceptedJobBuilder(
                type: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
