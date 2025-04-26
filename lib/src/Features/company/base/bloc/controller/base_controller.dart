import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jumper/src/Core/services/storage/storage_constants.dart';

class CompanyBaseController extends GetxController {
  final GetStorage _box = GetStorage();

  late int _tabIndex;

  int get tabIndex => _tabIndex;

  //
  // /// To update Button
  //   final FetchMyJobsController _fetchMyJobsController = Get.find();
  //   final CompanyStaticsController _companyStaticsController = Get.find();
  //   final MyEmployeesController _myEmployeesController = Get.find();
  //   final MyFavEmployeesController _myFavEmployeesController = Get.find();
  //   final CompanyMoreController _companyMoreController = Get.find();
  //
  // final _timer = Timer.periodic(
  //   const Duration(seconds: 3),
  //       (timer) {
  //
  //         printDM("${timer.tick}");
  //      // Navigate to your favorite place
  //   },
  // );
  //

  // void _updateBNBNumbers (){
  //   printDM("${_timer.tick}");
  // }

  void changeTabIndex(int newIndex) {
    _tabIndex = newIndex;
    _box.write(stgBNBCompanyIndex, newIndex);
    if (_tabIndex == 0) {
      // final CompanyStaticsController companyStaticsController =Get.find();
      // companyStaticsController.fetchCompanyStatics();
      // final FetchMyJobsController fetchMyJobsController =Get.find();
      // fetchMyJobsController.fetchJobs();
      // update();
    }
    update();
  }

  @override
  void onInit() {
    _tabIndex = _box.read(stgBNBCompanyIndex) ?? 0;

    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // _timer.cancel();
    // TODO: implement dispose
    super.dispose();
  }
}
