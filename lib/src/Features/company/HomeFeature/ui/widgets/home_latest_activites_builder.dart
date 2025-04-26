part of 'imports_widgets_home_screen.dart';

class CompanyHomeLatestActivityBuilder extends StatelessWidget {
  const CompanyHomeLatestActivityBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnAvailableBuilder(
      child: RequestStatusBuilder(
        status: RequestStatus.done,
        onDone: GetBuilder<CompanyHomeController>(builder: (_) {
          return ConditionalBuilder(
            condition: 0 == 0, // list not empty as an example
            onBuild: Column(
              children: [
                MainSectionButton(
                  label: "latest_activities".tr,
                  trailing: "all_activities".tr,
                  onPressed: () => _.showAllActivities(),
                ),
              ],
            ),
            onFeedBack: const SizedBox(),

            ///TODO: add empty screens
          );
        }),
        onLoading: const LoadingBox(
          heightRatio: 0.3,
        ),
      ),
    );
  }
}
