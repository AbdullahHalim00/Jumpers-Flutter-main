part of 'imports_widgets_job_details_screen.dart';

class PublishRequestButton extends StatelessWidget {
  final int jobID;

  const PublishRequestButton(this.jobID, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _publishNowController = Get.put(PublishNowController());
    return GetBuilder<PublishNowController>(
        init: _publishNowController,
        builder: (_) {
          return CustomRoundedButton.image(
            height: 54.h,
            backgroundColor: AppColors.secondary,
            label: "publish_now".tr,
            image: const AssetImage(Assets.add),
            // child: CustomText(
            //   "request_more".tr,
            //   color: AppColors.white,
            //   fontSize: 12,
            // ),
            onPressed: () {
              _.publish(jobID);
            },
          );
        });
  }
}
