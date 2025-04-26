part of 'imports_jumper_base .dart';

class JumperBaseScreen extends StatelessWidget {
  const JumperBaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(JumperBaseController());
    Get.put(JumperHomeController());
    Get.put(JumperJobsController());
    Get.put(AccountController());
    Get.put(ChangeNotificationsController());
    final ChatsController _chatsController = Get.put(ChatsController());
    return Scaffold(
      bottomNavigationBar: const JumperBottomNavBar(),
      body: GetBuilder<JumperBaseController>(builder: (cont) {
        return IndexedStack(
          index: cont.tabIndex,
          children: const [
            JumperHomeScreen(),
            JumperJobsScreen(),
            ManageWorkScreen(),
            AccountScreen(),
          ],
        );
      }),
    );
  }
}
