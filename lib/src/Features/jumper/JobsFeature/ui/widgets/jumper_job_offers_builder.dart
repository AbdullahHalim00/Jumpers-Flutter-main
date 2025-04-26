part of 'imports_widgets_jumper_jobs.dart';

class JumperJobOffersBuilder extends StatelessWidget {
  const JumperJobOffersBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JumperJobsController>(builder: (_) {
      return DataStatusBuilder(
        status: _.dataState,
        onDoneBuild: Visibility(
          visible: 0 == 0,
          replacement: Container(),

          ///should be replaced with illustration
          child: ConditionalBuilder(
            condition: _.jobs.isNotEmpty, // list not empty as an example
            onBuild: Column(
              children: [
                MainSectionButton(
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  label: "current_offers".tr,
                ),
                AnimatedWrapper(
                  index: _.jobs.length,
                  child: ListView.builder(
                    physics: AppPhysics.neverScrollable,
                    shrinkWrap: true,
                    itemCount: _.jobs.length,
                    itemBuilder: (context, index) {
                      final JumperJob job = _.jobs[index];
                      return JumperJobOfferCard(
                        job: job,
                      );
                    },
                  ),
                ),
              ],
            ),
            onFeedBack: Column(
              children: [
                MainSectionButton(
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  label: "current_offers",
                ),
                const EmptyJobApplicationsBuilder(),
              ],
            ),
          ),
        ),
        onLoadingBuild: const LoadingBox(
          heightRatio: 0.3,
        ),
      );
    });
  }
}
