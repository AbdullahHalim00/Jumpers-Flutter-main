part of 'company_help_center_imports.dart';

class CompanyHelpCenterScreen extends StatelessWidget {
  const CompanyHelpCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CompanyHelpCenterController());
    Get.put(FAQController());
    return CompanyHelpCenterScaffold(
        body: GetBuilder<FAQController>(builder: (_) {
      return DataStatusBuilder(
        status: _.dataState,
        onDoneBuild:
            GetBuilder<CompanyHelpCenterController>(builder: (helpController) {
          return AnimatedWrapper(
            index: 4,
            child: CustomListView(
              children: [
                AboutUsBuilder(
                  headLabel: "freq_questions".tr,
                  headBody: "freq_questions_details".tr,
                ),
                AppQuestionBuilder(
                  faqList: _.dataState.data ?? [],
                ),

                /// quest model should be sent here
                CompanyHelpCenterFooterBuilder(helpController),
              ],
            ),
          );
        }),
        onLoadingBuild: const LoadingBox(),
      );
    }));
  }
}
