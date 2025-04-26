part of 'IMPORTS_employees_screen.dart';

class EmployeesScreen extends StatelessWidget {
  const EmployeesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyEmployeesController());
    Get.put(MyFavEmployeesController());
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: DefaultScaffold(
        scaffoldColor: AppColors.scafBCGBasic,
        appBar: AppBars.employee(
          title: "employees".tr,
          bottom: TabBar(
            tabs: [
              Tab(
                text: "employees_all".tr,
              ),
              Tab(
                text: "employees_fav".tr,
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AllEmployeesScreen(),
            FavoriteEmployeesScreen(),
          ],
        ),
      ),
    );
  }
}
