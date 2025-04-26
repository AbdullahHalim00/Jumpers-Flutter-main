part of 'imports_jobs_screen.dart';

class EmptyJobApplicationsScreen extends StatelessWidget {
  const EmptyJobApplicationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyPageBuilder(
      title: "jobs_empty".tr,
      body: "jobs_empty_details".tr,
      imageUrl: Assets.empty_job_applications,
      onRedirect: () => Get.to(() => const CreateJobApplicationScreen()),
      redirectLabel: "create_request".tr,
      redirectImageUrl: Assets.add,
    );
  }
}

class EmptyJobUnderWayScreen extends StatelessWidget {
  const EmptyJobUnderWayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: EmptyPageBuilder(
        title: "jobs_empty_under_way".tr,
        // body: "jobs_empty_details".tr,
        imageUrl: Assets.empty_job_applications,
        // onRedirect: ()=>Get.to(()=>const CreateJobApplicationScreen()),
        // redirectLabel: "create_request".tr,
        // redirectImageUrl: Assets.add,
      ),
    );
  }
}
