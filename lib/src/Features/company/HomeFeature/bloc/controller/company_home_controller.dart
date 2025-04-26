import 'package:get/get.dart';

class CompanyHomeController extends GetxController {
  /// archived layout --------------------------------------
  bool _isArchivedSectionVisible = true;

  bool get isArchivedSectionVisible => _isArchivedSectionVisible;
  bool _showAnimation = false;

  bool get showAnimation => _showAnimation;

  void hideArchivedApplicationSection() {
    _isArchivedSectionVisible = false;
    _showAnimation = true;
    update();
    Future.delayed(
      const Duration(seconds: 2),
    ).then((value) {
      _showAnimation = false;
      update();
    });
  }

  /// activities layout --------------------------------------
  void showAllActivities() {
    // Get.to(()=>ActivityScreen());
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
