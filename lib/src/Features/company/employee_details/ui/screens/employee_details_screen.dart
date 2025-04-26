part of 'imports_employee_details_screen.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  final EmployeeModel employee;
  bool inFav = false;

  EmployeeDetailsScreen(
    this.employee, this.inFav,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EmployeeDetailsController());
    return GetBuilder<EmployeeDetailsController>(builder: (_) {
      return DefaultScaffold(
        scaffoldColor: AppColors.scafBCGBasic,
        appBar: AppBars.basic(
          title: "employee_details".tr,
          isBack: true,
          actions: [
            EmployeeDetailsOptions(employee, inFav),
          ],
        ),
        body: Column(
          children: [
            EmployeeDetailsHeader(
              employee: employee,
              inFav: inFav
            ),
            TabBar(
              controller: _.tabController,
              enableFeedback: false,
              onTap: null,
              tabs: [
                Tab(text: "employment_details".tr),
                // Tab(text: "activities_record".tr),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _.tabController,
                physics: AppPhysics.bouncingPhysics,
                children: [
                  SingleChildScrollView(
                    physics: AppPhysics.alwaysScrollablePhysics,
                    child: EmployeeDetailsBuilder(employee: employee),
                  ),
                  // const ActivitiesRecordBuilder(),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
