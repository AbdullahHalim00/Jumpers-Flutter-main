part of 'imports_job_details_screen.dart';

class JobDetailsScreen extends StatelessWidget {
  final CompanyJobModel job;
  int? type;

  JobDetailsScreen({
    Key? key,
    required this.job,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(JobDetailsController());
    Get.put(JobEmployeesController(jobId: job.id));
    Get.put(AcceptEmployeeController());
    Get.put(RefuseEmployeeController());
    Get.put(ReturnEmployeeController());
    Get.put(RequestMoreForJobController());
    final ChatsController chatsController = Get.find<ChatsController>();

    final JobEmployeesController jobEmployeesController = Get.find();
    final JobDetailsController jobDetailsController = Get.find();
    jobEmployeesController.fetchEmployees(jobID: job.id);
    if (type == 1) {
      jobDetailsController.tabController!.animateTo(1);
    }

    return GetBuilder<JobEmployeesController>(builder: (controller) {
      log("jobjob ${job.groupId}");
      return Scaffold(
        appBar: AppBars.basic(
          title: "job_details".tr,
          isBack: true,
          actions: [
            JobDetailsOptions(job: job),
          ],
        ),
        persistentFooterButtons: [
          Visibility(
            visible: job.status == ApplicationStatus.newRequest,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    if (controller.isCanPay) {
                      showDialog(
                          context: context,
                          builder: (_) => PayDialog(
                                context,
                                controller: controller,
                                job_id: job.id,
                              ));
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: controller.isCanPay
                            ? AppColors.secondary
                            : Colors.transparent,
                        border: Border.all(
                            width: 1,
                            color: controller.isCanPay
                                ? AppColors.transparent
                                : Colors.grey)),
                    child: Text(
                      'pay_now'.tr,
                      style: TextStyle(
                          color:
                              controller.isCanPay ? Colors.white : Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          if (job.groupId != 0)
            Visibility(
              visible: job.status == ApplicationStatus.reviewing ||
                  job.status == ApplicationStatus.underWay,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  CustomOutlinedButton.image(
                    primaryColor: AppColors.primary,
                    label: "send_message".tr,
                    image: const AssetImage(Assets.message_2),
                    isCurvedBorders: true,
                    onPressed: () {
                      chatsController.startChat(
                        targetID: job.groupId,
                        targetImage: null,
                        targetName: null,
                        targetToken: null,
                        chatType: 'group',
                      );
                      // _ChatsController.startChat(
                      //   targetID: job.id,
                      //   targetImage: job,
                      //   targetName: job.companyName,
                      //   targetToken: job.deviceToken,
                      // );
                      //  Get.to(() => StartChatScreen(
                      //   targetID: job.id,
                      //   targetImage: job.companyImage,
                      //   targetName: job.companyName,
                      // ));
                    },
                    height: 45.h,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          Visibility(
              visible: job.status == ApplicationStatus.completed,
              child: Column(
                children: [
                  Center(
                      child: Container(
                    height: 45,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.transparent,
                    ),
                    child: Text(
                      'completed'.tr,
                      style: const TextStyle(color: AppColors.green),
                    ),
                  )),
                ],
              )),
        ],
        body: Padding(
          padding: AppInsets.defaultScreenALL,
          child: NestedScrollView(
            physics: AppPhysics.alwaysScrollablePhysics,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBarJobDetails(job: job),
              ];
            },
            body: ((job.status == ApplicationStatus.pending))
                ? 0.0.ESH()
                : GetBuilder<JobDetailsController>(builder: (_) {
                    return TabBarView(
                      controller: _.tabController,
                      physics: AppPhysics.bouncingPhysics,
                      children: [
                        AllCandidatesScreen(
                          jobID: job.id,
                          job: job,
                        ),
                        AcceptedCandidatesScreen(
                          jobID: job.id,
                          job: job,
                        ),
                        RejectedCandidatesScreen(
                          jobID: job.id,
                          job: job,
                        ),
                      ],
                    );
                  }),
          ),
        ),
      );
    });
  }
}
