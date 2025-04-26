import 'package:get/get.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/company/job_details/bloc/controller/job_employees_controller.dart';
import 'package:jumper/src/Features/company/job_details/bloc/repo/refuse_employee_repo.dart';
import 'package:jumper/src/Ui/snackbar/app_snacks.dart';

class RefuseEmployeeController extends GetxController {
  /// -------------- API CALLS --------------
  final RefuseEmployeeApiRepo _refuseEmployeeApiRepo =
      Get.put(RefuseEmployeeApiRepo());

  DataState<bool> _dataState = const DataLoading<bool>();

  DataState<bool> get dataState => _dataState;

  Future<bool> refuseEmployee(
    int jobID,
    int employeeID,
  ) async {
    Utils.showLoadingDialog();
    bool isAccepted = false;
    _dataState = const DataLoading();
    update();
    _dataState = await (_refuseEmployeeApiRepo.refuseEmployee(
        jobId: jobID, employeeID: employeeID)!);
    Get.back();
    isAccepted = _dataState.data!;
    update();
    _checkAcceptedEmployee(isAccepted, jobID);
    return isAccepted;
  }

  void _checkAcceptedEmployee(
    bool isAccepted,
    int jobID,
  ) {
    if (isAccepted) {
      AppSnacks.rejectEmployee(isToast: true);
      final JobEmployeesController jobEmployeesController = Get.find();
      jobEmployeesController.fetchEmployees(jobID: jobID);
      // delete from model
    } else {
      AppSnacks.requestError(isToast: true);
    }
  }
}
