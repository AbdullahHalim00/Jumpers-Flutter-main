part of 'terms_conditions_imports.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TermsController());
    return DefaultScaffold(
      appBar: AppBars.basic(
        title: "terms".tr,
        isBack: true,
      ),
      scaffoldColor: AppColors.scafBCGBasic,
      body: DefaultContainer(
        hasBorder: false,
        child: GetBuilder<TermsController>(builder: (_) {
          return DataStatusBuilder(
            status: _.dataState,
            onDoneBuild: _.dataState is! DataSuccess
                ? 0.0.ESH()
                : StaticTextItem(
                    title: "terms".tr,
                    body: _.dataState.data!.text ?? "",
                  ),
            onLoadingBuild: const LoadingBox(),
          );
        }),
      ),
    );
  }
}
