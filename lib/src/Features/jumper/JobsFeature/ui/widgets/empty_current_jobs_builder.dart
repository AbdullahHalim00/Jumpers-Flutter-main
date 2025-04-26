part of 'imports_widgets_jumper_jobs.dart';

class EmptyCurrentJobsBuilder extends StatelessWidget {
  const EmptyCurrentJobsBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyPageBuilder(
      imageUrl: Assets.empty_new_offers,
      title: "empty_current_jobs".tr,
      body: "empty_current_jobs_details".tr,
    );
  }
}
