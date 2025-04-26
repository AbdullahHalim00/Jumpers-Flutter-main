import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/utils/date_utilities.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/company/EmployeesFeature/bloc/params/employee_term_extension_params.dart';
import 'package:jumper/src/Features/company/EmployeesFeature/bloc/repo/employee_term_extension_repo.dart';
import 'package:jumper/src/Ui/sheets/date_picker_sheet.dart';

class EmployeeTermExtensionController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;
  bool _isButtonDisabled = true;

  bool get isButtonDisabled => _isButtonDisabled;

  /// ---------------- WorkTimeType ----------------
  TextEditingController? startDateController;
  TextEditingController? endDateController;

  TextEditingController? periodController;

  /// -------------- API CALLS --------------

  final EmployeeTermExtensionApiRepo _employeeTermExtensionApiRepo =
      Get.put(EmployeeTermExtensionApiRepo());

  DataState<bool> _dataState = const DataInitial<bool>();

  DataState<bool> get dataState => _dataState;

  Future<bool> extendPeriod({required int employeeId}) async {
    // Utils.showLoadingDialog();
    bool isDone = false;
    _dataState = const DataLoading();
    update();
    _dataState = await (_employeeTermExtensionApiRepo.extendPeriod(
      params: EmployeeTermExtensionParams(
        employeeId: employeeId,
        startDate: startDateController!.text,
        endDate: endDateController!.text,
        // period: periodController!.text.adN,
      ),
    ));
    // Get.back();
    isDone = _dataState.data!;
    update();
    _onExtendPeriodSuccess(isDone, message: _dataState.message ?? "");
    return isDone;
  }

  /// -----------------------------------------------------------
  void _onExtendPeriodSuccess(bool isDone, {required String message}) {
    if (isDone) {
      Get.back();

      /// do smth
    }
    Utils.showDefaultSnackBar(title: message);
  }

  ///---------------------date and period ----------------------------
  void pickStartDate() {
    Get.bottomSheet(
      DatePickerSheet(
        init: DateTime.now(),
        title: "start_date".tr,
        onConfirmed: (startDate) {
          if (startDate != null) {
            startDateController?.text =
                DateUtilities.convertDateToYMD(startDate);
          }
        },
      ),
    );
    _calcWorkPeriodAuto();
  }

  void pickEndDate() {
    Get.bottomSheet(
      DatePickerSheet(
        init: DateTime.now(),
        title: "end_date".tr,
        onConfirmed: (endDate) {
          if (endDate != null) {
            endDateController?.text = DateUtilities.convertDateToYMD(endDate);
          }
        },
      ),
    );
    _calcWorkPeriodAuto();
  }

  int _days = 0;

  void _calcWorkPeriodAuto() {
    endDateController?.addListener(() {
      if (startDateController!.text.isNotEmpty &&
              endDateController!.text.isNotEmpty
          // &&
          // workContractDurationController!.text.isEmpty
          ) {
        final date1 = DateTime.parse(startDateController!.text);
        final date2 = DateTime.parse(endDateController!.text);
        final difference = date2.difference(date1).inDays;
        if (difference >= 0) {
          periodController!.text =
              DateUtilities.convertDurationToDay(difference);
          _days = difference;
          printDM("_days is $_days");
        } else {
          Utils.showToast(
            title: "work_contract_duration_caution".tr,
            state: UtilState.Error,
          );
          startDateController?.removeListener(() {});
          endDateController?.removeListener(() {});
        }
      }
    });
    update();
  }

  @override
  void onInit() {
    _initControllers();
    _listenToSetControllers();
    // TODO: implement onInit
    super.onInit();
  }

  void _initControllers() {
    startDateController = TextEditingController();
    endDateController = TextEditingController();
    periodController = TextEditingController();
  }

  void _listenToSetControllers() {
    startDateController?.addListener(() {
      _checkProceedButtonCondition();
    });
    endDateController?.addListener(() {
      _checkProceedButtonCondition();
    });
    periodController?.addListener(() {
      _checkProceedButtonCondition();
    });
  }

  void _checkProceedButtonCondition() {
    if (startDateController!.text.isNotEmpty &&
        endDateController!.text.isNotEmpty &&
        periodController!.text.isNotEmpty) {
      _isButtonDisabled = false;
      update();
    }
  }

  @override
  void dispose() {
    startDateController?.dispose();
    endDateController?.dispose();
    periodController?.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}

// int _workTimeTypeID = 0;
// int get workTimeTypeID => _workTimeTypeID;
// void onWorkTimeTypeTapped() {
//    AppSheet.showDefaultSheet(
//     WorkTimeTypeBottomSheet(
//         onSave: (id, title) {
//           workTimeTypeController?.text = title;
//           _workTimeTypeID = id;
//           update();
//         }),
//   );
// }
// String _workStartTime = '';
// String _workEndTime = '';

// void pickStartTime() {
//   if (_accountTypeId == 0) {
//     AppSnacks.requestError(error: 'must_select_account_type_first'.tr);
//   } else {
//     Get.bottomSheet(
//       TimePickerSheet(
//         title: "work_start_time".tr,
//         onConfirm: (DateTime? date) {
//           if (date != null) {
//             workStartTimeController!.text =
//                 DateUtilities.convertDateToTime(date);
//             _workStartTime = DateUtilities.convertDateToTime24(date);
//             workEndTimeController!.text =
//                 DateUtilities.convertDateToTimeAndAddHours(
//                     date, int.parse(accountTypeController!.text.toString()));
//             _workEndTime = DateUtilities.convertDateToTimeAndAddHours24(
//                 date, int.parse(accountTypeController!.text.toString()));
//             printDM("date selected is $date");
//           }
//         },
//       ),
//       shape: AppShapes.bottomSheetShape,
//     );
//   }
// }
