part of 'imports_jumper_onboarding.dart';

class JumperOnBoardingScreen extends StatelessWidget {
  const JumperOnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(JumperOnBoardingController());
    return JumperOnBoardingScaffold(
      child: GetBuilder<JumperOnBoardingController>(
          init: JumperOnBoardingController(),
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
                const JumperOnBoardingIndicator(),
                JumperOnBoardingFooterButtons(controller: _),
              ],
            );
          }),
    );
  }
}
