part of 'imports_service_details.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final JumperJob job;
  int? type;

  ServiceDetailsScreen(
    this.job,
    this.type, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ServiceDetailsController());
    Get.put(CompanyDetailsController(job.companyID));
    Get.put(AcceptJobController(job.id));
    Get.put(RefuseJobController(job.id));

    return GetBuilder<ServiceDetailsController>(builder: (_) {
      return DefaultTabController(
        length: _.tabController!.length,
        child: Scaffold(
          appBar: AppBars.basic(
            title: "service_details".tr,
            isBack: true,
          ),
          persistentFooterButtons: [
            Visibility(
              visible: type == 0 ? job.status == 1 || job.status == 0 : false,
              child: const ServiceDetailsFooterButtons(),
            ),
          ],
          body: NestedScrollView(
            physics: AppPhysics.alwaysScrollablePhysics,
            headerSliverBuilder:
                (BuildContext context, bool isInnerBoxScrolled) {
              return [
                SliverAppBar(
                  floating: true,
                  pinned: true,
                  snap: true,
                  automaticallyImplyLeading: false,
                  backgroundColor: AppColors.white,
                  toolbarHeight: (kToolbarHeight * 4.3).h,
                  flexibleSpace: FlexibleSpaceBar(
                    background: ServiceDetailsHeader(
                      jobTitle: job.serviceTitle,
                      serviceImage: job.companyImage,
                      salary: job.salary.toString(),
                      workType: job.timeTypeTitle,
                      address: job.companyAddress,
                      workPlace: job.workTypeTitle,
                    ),
                  ),
                  bottom: ColoredTabBar(
                    color: AppColors.white,
                    tabBar: TabBar(
                      controller: _.tabController,
                      tabs: [
                        Tab(text: "job_info".tr),
                        Tab(text: "organisation_info".tr),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: _.tabController,
              physics: AppPhysics.alwaysScrollablePhysics,
              children: [
                ServiceDetailsJobInfoBuilder(job),
                const ServiceDetailsOrganizationInfoBuilder(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
