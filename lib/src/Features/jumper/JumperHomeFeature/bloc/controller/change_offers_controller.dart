import 'package:get/get.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/jumper/JumperHomeFeature/bloc/controller/jumper_jobs_controller.dart';
import 'package:jumper/src/Features/jumper/JumperHomeFeature/bloc/repo/change_offers_repo.dart';

class ChangeOffersController extends GetxController {
  /// -------------- API CALLS --------------
  final ChangeOffersRepo _changeOffersRepo = Get.put(ChangeOffersRepo());

  DataState<bool> _dataState = const DataInitial<bool>();

  DataState<bool> get dataState => _dataState;
  bool isChanged = false;

  Future<bool> changeStatus({required bool initialValue}) async {
    Utils.showLoadingDialog();
    _dataState = const DataLoading();
    update();
    _dataState = await (_changeOffersRepo.changeStatus())!;
    Utils.closeDialog();
    isChanged = _dataState.data!;
    update();
    _checkAcceptedJob(isChanged, _dataState.message ?? "");

    if (initialValue == isChanged) {
      return isChanged;
    } else {
      return initialValue;
    }
  }

  void _checkAcceptedJob(bool isChanged, String message) {
    Utils.showToast(
      title: message,
      state: UtilState.None,
    );
    Get.back();
    // Utils.closeDialog();
    if (isChanged) {
      /// review ----
      final JumperJobsController jumperJobsController = Get.find();
      jumperJobsController.fetchJobs();

      ///  ----
    }
  }
}
