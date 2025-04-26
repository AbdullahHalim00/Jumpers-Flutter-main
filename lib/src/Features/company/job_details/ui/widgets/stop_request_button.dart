part of 'imports_widgets_job_details_screen.dart';

class StopRequestButton extends StatelessWidget {
  final int jobID;

  const StopRequestButton(this.jobID, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StopRequestController _stopRequestController =
        Get.put(StopRequestController());
    return GetBuilder<StopRequestController>(
        init: _stopRequestController,
        builder: (_) {
          return CustomOutlinedButton(
            height: 54.h,
            isCurvedBorders: true,
            primaryColor: AppColors.secondary,
            child: CustomText(
              "stop_request".tr,
              color: AppColors.secondary,
              fontSize: 14,
            ),
            // label:  "stop_request".tr,
            // image:const AssetImage( Assets.close),
            // child: CustomText(
            //   "request_more".tr,
            //   color: AppColors.white,
            //   fontSize: 12,
            // ),
            onPressed: () {
              _.stop(jobID);
            },
          );
        });
  }
}
