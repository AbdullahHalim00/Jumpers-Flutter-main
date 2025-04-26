part of 'imports_widgets_job_details_screen.dart';

class JobDetailsOptions extends StatelessWidget {
  final CompanyJobModel job;

  const JobDetailsOptions({
    Key? key,
    required this.job,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeleteJobRequestController>(builder: (logic) {
      return DefaultPopUpButton(
        hasBCG: false,
        popUps: [
          if (job.status == ApplicationStatus.newRequest)
            // PopUpModel(
            //   imageUrl: Assets.edit,
            //   label: "edit_application".tr,
            //   onSelected: () {
            //     if (job.status == ApplicationStatus.newRequest ||
            //         job.status == ApplicationStatus.pending) {
            //       Get.to(
            //         () => CreateJobApplicationScreen(
            //             title: "edit_request".tr,
            //             companyJobModel: job,
            //             isEdit: true),
            //       );
            //     } else {
            //       Utils.showDefaultSnackBar(
            //         title: "edit_cannot_be_done".tr,
            //         state: UtilState.Warning,
            //       );
            //     }
            //     // Get.delete();
            //   },
            //   color: AppColors.black,
            // ),
            PopUpModel(
              imageUrl: Assets.closeRed,
              label: "delete_application".tr,
              onSelected: () {
                Get.back();
                logic.deleteRequest(job.id).then((value) {
                  if (value) {
                    //  Utils.showDefaultSnackBar(
                    //   title: "delete_req_success".tr,
                    //   state: UtilState.Success,
                    // );
                    Get.back();
                    FetchMyJobsController fetchMyJobsController =
                        Get.put(FetchMyJobsController());
                    // fetchMyJobsController.deleteJobRequest(job.id);
                    fetchMyJobsController.fetchJobs().then((_) {
                      Get.offAll(() => const CompanyBaseScreen());
                    });
                  }
                });
              },
              color: AppColors.red,
            ),
          PopUpModel(
            // imageUrl: Assets.chat,
            icon: Icons.chat,
            label: "contact_us".tr, //"chat_with_support".tr,
            onSelected: () {
              Get.back();
              Get.to(()=> ContactUsScreen());
              // Get.back();
              // logic.deleteRequest(job.id).then((value) {
              //   if (value) {
              //     //  Utils.showDefaultSnackBar(
              //     //   title: "delete_req_success".tr,
              //     //   state: UtilState.Success,
              //     // );
              //     Get.back();
              //     FetchMyJobsController fetchMyJobsController =
              //     Get.put(FetchMyJobsController());
              //     // fetchMyJobsController.deleteJobRequest(job.id);
              //     fetchMyJobsController.fetchJobs().then((_) {
              //       Get.offAll(() => const CompanyBaseScreen());
              //     });
              //   }
              // });
            },
            color: AppColors.green,
          ),
        ],
      );
    });
  }
}
