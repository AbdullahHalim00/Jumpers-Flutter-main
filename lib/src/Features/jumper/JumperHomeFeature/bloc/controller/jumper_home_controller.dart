import 'package:get/get.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/jumper/BaseFeature/bloc/controller/jumper_base_controller.dart';
import 'package:jumper/src/Features/jumper/JumperHomeFeature/ui/widgets/import_widgets_j_home.dart';

class JumperHomeController extends GetxController {
  /// Job Apps Req layout --------------------------------------
  void showAllJobAppsReq() {
    final JumperBaseController jumperBaseController = Get.find();
    jumperBaseController.changeTabIndex(1);

    // Get.to(()=> JumperJobsScreen());
  }

  /// Job Apps Req layout --------------------------------------
  void showAllActivities() {
    // Get.to(()=>ActivityScreen());
  }

  /// -------------------------- Dialogs --------------------------

  void showJoinAsVolunteerDialog() {
    if (0 == 0) {
      /// check if he 'controller a volunteer or not
      Future.delayed(
        const Duration(seconds: 5),
      ).then((value) {
        // Utils.showDialog(child: const BuildVolunteerDialog());
        Utils.showDialog(child: const BuildVolunteerDialog());
      });
    }
  }

  @override
  void onInit() {
    // showJoinAsVolunteerDialog();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
