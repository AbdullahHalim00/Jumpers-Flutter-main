part of 'imports_home_screen.dart';

class CompanyHomeScreen extends StatefulWidget {
  const CompanyHomeScreen({super.key});

  @override
  State<CompanyHomeScreen> createState() => _CompanyHomeScreenState();
}

class _CompanyHomeScreenState extends State<CompanyHomeScreen> {
  String dropdownValue = "jobs_all".tr;

  final List<String> list = [
    "jobs_all".tr,
    "jobs_new".tr,
    // "jobs_pended".tr,
    "jobs_under_review".tr,
    "jobs_uncompleted".tr, // uncompleted
    // "jobs_underway".tr,
    "jobs_completed".tr,
    "jobs_canceled".tr,
  ];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  final List<Widget> widgetList = const [
    // SizedBox.shrink(),
    AllJobsBuilder(),
    NewJobsBuilder(),
    // PendingJobsBuilder(),
    ReviewingJobsBuilder(),
    UnCompletedJobsBuilder(),
    CompletedJobsBuilder(),
    CanceledJobsBuilder(),
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(CompanyHomeController());
    // final CompanyStaticsController _companyStaticsController =
    //     Get.put(CompanyStaticsController());
    final FetchMyJobsController _fetchMyJobsController =
        Get.put(FetchMyJobsController());

    return GetBuilder<FetchMyJobsController>(builder: (fetchMyJobsController) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CompanyHomeAppBar(),
        ),
        body: AndroidOnRefresh(
          onRefresh: () async {
            await fetchMyJobsController.fetchJobs();
          },
          child: CustomScrollView(
            slivers: [
              // Wrap your widgets with the SliverToBoxAdapter
              SliverToBoxAdapter(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: AppInsets.defaultScreenALL,
                        child: fetchMyJobsController.dataState ==
                                const DataLoading()
                            ? const LoadingBox()
                            : CustomListView(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                children: [
                                  const CompanyHomeWelcomeHeader(),
                                  // 18.0.ESH(),
                                  //
                                  // // const CompanyHomeStaticsBuilder(),
                                  // 25.0.ESH(),
                                  //
                                  20.0.ESH(),
                                  Container(
                                    height: 40.h,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 0.w),
                                    child: DropdownButton<String>(
                                      selectedItemBuilder:
                                          (BuildContext context) {
                                        return list.map((String value) {
                                          return Padding(
                                            padding: EdgeInsets.only(top: 10.h),
                                            child: CustomText(
                                              dropdownValue,
                                              isBold: true,
                                              fontSize: 12,
                                              isOverFlow: true,
                                            ),
                                          );
                                        }).toList();
                                      },
                                      icon: const Icon(
                                          Icons.arrow_drop_down_sharp),
                                      alignment: Alignment.center,
                                      underline: const SizedBox(),
                                      value: dropdownValue,
                                      items: List.generate(
                                        list.length,
                                        (index) {
                                          final item = list[index];
                                          return DropdownMenuItem<String>(
                                            value: item,
                                            onTap: () => fetchMyJobsController
                                                .changeView(index),
                                            child: CustomText(
                                              item,
                                              fontWeight: FW.regular,
                                              fontSize: 12,
                                            ),
                                          );
                                        },
                                      ),
                                      onChanged: (String? newValue) {
                                        setState(
                                          () {
                                            dropdownValue = newValue!;
                                            debugPrint(
                                                "value is $dropdownValue  ");
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  // const CompanyHomeArchivedApplicationsBuilder(),
                                  // const CompanyHomeLatestActivityBuilder(),
                                ],
                              ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.w),
                        child: widgetList[_fetchMyJobsController.index],
                      ),
                      // Stack(
                      //   // margin: EdgeInsets.symmetric(horizontal: 16.w),
                      //   children: [
                      //     widgetList[fetchMyJobsController.index],
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
