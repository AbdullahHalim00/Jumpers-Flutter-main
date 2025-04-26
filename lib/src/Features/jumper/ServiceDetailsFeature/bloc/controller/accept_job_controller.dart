import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/decorations/app_Insets.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/jumper/JumperHomeFeature/bloc/controller/jumper_jobs_controller.dart';
import 'package:jumper/src/Features/jumper/ServiceDetailsFeature/bloc/repo/accept_job_repo.dart';
import 'package:jumper/src/Features/jumper/ServiceDetailsFeature/ui/screens/imports_service_details.dart';
import 'package:jumper/src/Features/shared/AgreementFeature/ui/BuildAgreementDialog.dart';

class AcceptJobController extends GetxController {
  final int jobId;

  AcceptJobController(this.jobId);

  /// -------------- API CALLS --------------
  final AcceptJobRepo _acceptJobRepo = Get.put(AcceptJobRepo());

  DataState<bool> _dataState = const DataInitial<bool>();

  DataState<bool> get dataState => _dataState;

  Future<bool> acceptJob(int jobID) async {
    Utils.showLoadingDialog();
    bool isAccepted = false;
    _dataState = const DataLoading();
    update();
    _dataState = await (_acceptJobRepo.acceptJob(jobId: jobID)!);
    Get.back();
    isAccepted = _dataState.data!;
    update();
    _checkAcceptedJob(isAccepted, _dataState.message ?? "");
    return isAccepted;
  }

  void _checkAcceptedJob(bool isAccepted, String message) {
    Utils.showDefaultSnackBar(title: message);
    if (isAccepted) {
      /// review ----
      final JumperJobsController jumperJobsController = Get.find();
      jumperJobsController.fetchJobs();

      ///  ----
      Get.to(() => JobAppAcceptedScreen());
    }
  }

  void showAgreementDialog() {
    Utils.showDialog(
      insetPadding: AppInsets.defaultScreenALL,
      child: BuildAgreementDialog(
        onAccept: () {
          acceptJob(jobId);
        },
      ),
    );
  }
}
