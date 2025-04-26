import 'dart:developer';

import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/contact_model.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/company/job_details/bloc/controller/job_employees_controller.dart';
import 'package:jumper/src/Features/company/job_details/bloc/repo/accept_employee_repo.dart';
import 'package:jumper/src/Ui/snackbar/app_snacks.dart';

class AcceptEmployeeController extends GetxController {
  /// -------------- API CALLS --------------
  final AcceptEmployeeApiRepo _acceptEmployeeApiRepo =
      Get.put(AcceptEmployeeApiRepo());

  DataState<bool> _dataState = const DataInitial<bool>();

  DataState<bool> get dataState => _dataState;

  DataState<ContactUsResponse> _rateDataState =
      const DataInitial<ContactUsResponse>();

  DataState<ContactUsResponse> get rateDataState => _rateDataState;

  double rateReview = 0.0;

  Future<bool> acceptEmployee(
    int jobID,
    int employeeID,
  ) async {
    Utils.showLoadingDialog();
    bool isAccepted = false;
    _dataState = const DataLoading();
    update();
    _dataState = await (_acceptEmployeeApiRepo.acceptEmployee(
        jobId: jobID, employeeID: employeeID)!);
    Get.back();
    if (dataState.data != null) {
      isAccepted = _dataState.data!;
    }
    update();
    _checkAcceptedEmployee(isAccepted, jobID);
    return isAccepted;
  }

  void rateEmployee(
    int jobID,
    int employeeID,
  ) async {
    Utils.showLoadingDialog();

    _rateDataState = const DataLoading();
    update();
    _rateDataState = await (_acceptEmployeeApiRepo.rateEmployee(
        jobId: jobID, employeeID: employeeID, rate: rateReview)!);

    if (_rateDataState.message != "") {
      log("HHHHH");
      Get.back();
      Get.back();
      update();
      final JobEmployeesController jobEmployeesController = Get.find();
      jobEmployeesController.fetchEmployees(jobID: jobID);
      AppSnacks.successMessage(message: "Rate Employee Done", isToast: true);
    }
  }

  void _checkAcceptedEmployee(
    bool isAccepted,
    int jobID,
  ) {
    if (isAccepted) {
      AppSnacks.acceptEmployee(isToast: true);
      final JobEmployeesController jobEmployeesController = Get.find();
      jobEmployeesController.fetchEmployees(jobID: jobID);
      // delete from model
    } else {}
  }
}
