part of 'imports_widgets_job_details_screen.dart';

class RequestMoreCandidatesButton extends StatelessWidget {
  final int jobID;

  const RequestMoreCandidatesButton(this.jobID, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestMoreForJobController>(builder: (_) {
      return CustomRoundedButton.image(
        height: 54.h,
        backgroundColor: AppColors.secondary,
        label: "request_more".tr,
        image: const AssetImage(Assets.add),
        // child: CustomText(
        //   "request_more".tr,
        //   color: AppColors.white,
        //   fontSize: 12,
        // ),
        onPressed: () {
          _.requestMore(jobID);
        },
      );
    });
  }
}
