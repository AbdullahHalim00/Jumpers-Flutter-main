part of 'imports_widgets_job_details_screen.dart';

class SliverAppBarJobDetails extends StatelessWidget {
  final CompanyJobModel job;

  const SliverAppBarJobDetails({
    Key? key,
    required this.job,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final JobEmployeesController jobEmployeeController = Get.find();
    return GetBuilder<JobDetailsController>(builder: (_) {
      return GetBuilder<JobEmployeesController>(
          builder: (jobEmployeeController) {
        return SliverAppBar(
          floating: true,
          pinned: true,
          snap: true,
          backgroundColor: AppColors.white,
          toolbarHeight: (kToolbarHeight * 7.9).h,
          leading: null,
          title: null,
          automaticallyImplyLeading: false,
          flexibleSpace: FlexibleSpaceBar(
            title: null,
            centerTitle: false,
            background: AnimatedWrapper(
              styles: WrapAnimationStyles.scale,
              child: JobDetailsCard(
                job: job,
                jobId: job.id,
                status: job.status,
                jobTitle: job.serviceTitle,
                salary: job.salary.toString(),
                address: job.companyAddress,
                workType: job.workTypeTitle,
                workStartTime: job.startTimeFormat,
                workEndTime: job.endTimeFormat,
                workStartDate: job.startDate,
                workEndDate: job.endDate,
                fullAddress: job.fullAddress,
                onDetailsPress: () {
                  Get.to(() => CompanyServiceDetailsScreen(
                        job: job,
                      ));
                },
              ),
            ),
          ),
          bottom: (job.status == ApplicationStatus.pending)
              ? null
              : ColoredTabBar(
                  color: AppColors.white,
                  tabBar: TabBar(
                    isScrollable: true,
                    controller: _.tabController,
                    physics: AppPhysics.bouncingPhysics,
                    tabs: [
                      Tab(
                        child: CustomText(
                          "all_candidates".tr +
                              "(${jobEmployeeController.dataState.data?.allEmployees.length ?? 0})",
                          fontSize: 14,
                        ),
                      ),
                      Tab(
                          child: CustomText(
                        "accepted".tr +
                            "(${jobEmployeeController.dataState.data?.acceptedEmployees.length ?? 0})",
                        fontSize: 14,
                      )),
                      Tab(
                        child: CustomText(
                          "rejected".tr +
                              "(${jobEmployeeController.dataState.data?.refusedEmployees.length ?? 0})",
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
        );
      });
    });
  }
}
