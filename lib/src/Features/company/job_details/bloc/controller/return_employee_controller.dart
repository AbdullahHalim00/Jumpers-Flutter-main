import 'package:get/get.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/company/job_details/bloc/controller/job_employees_controller.dart';
import 'package:jumper/src/Features/company/job_details/bloc/repo/return_employee_repo.dart';
import 'package:jumper/src/Ui/snackbar/app_snacks.dart';

class ReturnEmployeeController extends GetxController {
  final ReturnEmployeeApiRepo _returnEmployeeApiRepo =
      Get.put(ReturnEmployeeApiRepo());

  DataState<bool> _dataState = const DataInitial<bool>();

  DataState<bool> get dataState => _dataState;

  Future<bool> restore(
    int jobID,
    int employeeID,
  ) async {
    Utils.showLoadingDialog();
    bool isReturned = false;
    _dataState = const DataLoading();
    update();
    _dataState = await (_returnEmployeeApiRepo.returnEmployee(
        jobId: jobID, employeeID: employeeID)!);
    Get.back();
    isReturned = _dataState.data!;
    update();
    _checkReturnedEmployee(isReturned, jobID);
    return isReturned;
  }

  void _checkReturnedEmployee(
    bool isReturned,
    int jobID,
  ) {
    if (isReturned) {
      AppSnacks.returnEmployee(isToast: true);
      final JobEmployeesController jobEmployeesController = Get.find();
      jobEmployeesController.fetchEmployees(jobID: jobID);
      // delete from model
    } else {
      AppSnacks.requestError(isToast: true);
    }
  }
}
