part of 'imports_company_onboarding.dart';

class CompanyOnBoardingScreen extends StatelessWidget {
  const CompanyOnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CompanyOnBoardingController());
    return CompanyOnBoardingScaffold(
      child: GetBuilder<CompanyOnBoardingController>(
          init: CompanyOnBoardingController(),
          builder: (_) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      controller: _.pageController,
                      itemCount: _.data.length,
                      onPageChanged: (index) => _.onPageChanged(index),
                      itemBuilder: (ctx, index) {
                        // _.updatePageIndex(index);
                        return OnBoardingScreenContentItem(
                          image: "${_.data[index].imageUrl}",
                          title: "${index + 1}" + ". " "${_.data[index].title}",
                          body: "${_.data[index].body}",
                        );
                      }),
                ),
                const CompanyOnBoardingIndicator(),
                CompanyOnBoardingFooterButtons(_),
              ],
            );
          }),
    );
  }
}
