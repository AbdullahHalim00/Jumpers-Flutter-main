part of 'imports_company_base_screen.dart';

class CompanyBaseScreen extends StatelessWidget {
  const CompanyBaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ChangeNotificationsController());
    final ChatsController _chatsController = Get.put(ChatsController());

    return Scaffold(
      appBar: null,
      bottomNavigationBar: const CompanyBottomNavBar(),
      body: GetBuilder<CompanyBaseController>(
          init: CompanyBaseController(),
          builder: (cont) {
            return IndexedStack(
              index: cont.tabIndex,
              children: [
                CompanyHomeScreen(),
                const JobsScreen(),
                const EmployeesScreen(),
                const CompanyMoreScreen(),
              ],
            );
          }),
    );
  }
}
