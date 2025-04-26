part of 'terms_conditions_imports.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PrivacyController());
    return DefaultScaffold(
      appBar: AppBars.basic(
        title: "privacy".tr,
        isBack: true,
      ),
      scaffoldColor: AppColors.scafBCGBasic,
      body: DefaultContainer(
        hasBorder: false,
        child: GetBuilder<PrivacyController>(builder: (_) {
          return DataStatusBuilder(
            status: _.dataState,
            onDoneBuild: _.dataState is! DataSuccess
                ? 0.0.ESH()
                : StaticTextItem(
                    title: "privacy".tr,
                    body: _.dataState.data!.text ?? "",
                  ),
            onLoadingBuild: const LoadingBox(),
          );
        }),
      ),
    );
  }
}
