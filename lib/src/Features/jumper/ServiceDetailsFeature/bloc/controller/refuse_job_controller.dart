import 'package:get/get.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/jumper/BaseFeature/ui/screens/imports_jumper_base%20.dart';
import 'package:jumper/src/Features/jumper/JumperHomeFeature/bloc/controller/jumper_jobs_controller.dart';
import 'package:jumper/src/Features/jumper/ServiceDetailsFeature/bloc/repo/refuse_job_repo.dart';
import 'package:jumper/src/Features/jumper/ServiceDetailsFeature/ui/widgets/imports_widgets_service_details.dart';

class RefuseJobController extends GetxController {
  final int jobId;

  RefuseJobController(this.jobId);

  /// -------------- API CALLS --------------
  final RefuseJobRepo _refuseRepo = Get.put(RefuseJobRepo());

  DataState<bool> _dataState = const DataInitial<bool>();

  DataState<bool> get dataState => _dataState;

  Future<bool> refuseJob(int jobID) async {
    Utils.showLoadingDialog();
    bool isRefused = false;
    _dataState = const DataLoading();
    update();
    _dataState = await (_refuseRepo.refuseJob(jobId: jobID)!);
    Get.back();
    isRefused = _dataState.data!;
    update();
    _checkRefusedJob(isRefused, _dataState.message ?? "");
    return isRefused;
  }

  void _checkRefusedJob(bool isRefused, String message) {
    Utils.showDefaultSnackBar(title: message);
    if (isRefused) {
      /// review ----
      final JumperJobsController jumperJobsController = Get.find();
      jumperJobsController.fetchJobs();

      ///  ----
      Get.to(() => const JumperBaseScreen());
    }
  }

  void showRejectJobOfferDialog() {
    Utils.showDialog(
      child: BuildRejectJobOfferDialog(
        onReject: () {
          refuseJob(jobId);
        },
      ),
    );
  }
}
