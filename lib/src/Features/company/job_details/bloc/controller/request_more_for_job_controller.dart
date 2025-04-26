import 'package:get/get.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/company/job_details/bloc/controller/job_employees_controller.dart';
import 'package:jumper/src/Features/company/job_details/bloc/repo/request_more_for_job_repo.dart';

class RequestMoreForJobController extends GetxController {
  /// -------------- API CALLS --------------
  final RequestMoreForJobJobRepo _requestMoreForJobJobRepo =
      Get.put(RequestMoreForJobJobRepo());

  DataState<bool> _dataState = const DataInitial<bool>();

  DataState<bool> get dataState => _dataState;

  Future<bool> requestMore(int jobID) async {
    Utils.showLoadingDialog();
    bool isDone = false;
    _dataState = const DataLoading();
    update();
    _dataState = await (_requestMoreForJobJobRepo.request(jobId: jobID)!);
    Get.back();
    isDone = _dataState.data!;
    update();
    _checkAcceptedJob(isDone, _dataState.message ?? "", jobId: jobID);
    return isDone;
  }

  void _checkAcceptedJob(bool isDone, String message, {required int jobId}) {
    Utils.showDefaultSnackBar(
      title: message,
      state: UtilState.Success,
    );
    if (isDone) {
      final JobEmployeesController jobEmployeesController = Get.find();
      jobEmployeesController.fetchEmployees(jobID: jobId);

      // Get.off(()=>CompanyBaseScreen());
      /// review ----
      ///  ----
    }
  }
}
