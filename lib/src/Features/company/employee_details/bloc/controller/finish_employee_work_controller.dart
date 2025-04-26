import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/company/EmployeesFeature/bloc/controller/my_employees_controller.dart';
import 'package:jumper/src/Features/company/base/ui/screens/imports_company_base_screen.dart';
import 'package:jumper/src/Features/company/employee_details/bloc/params/finish_employee_params.dart';
import 'package:jumper/src/Features/company/employee_details/bloc/repo/finish_employee_repo.dart';
import 'package:jumper/src/Features/company/employee_details/ui/widgets/imports_widgets_employee_details.dart';
import 'package:jumper/src/Ui/sheets/app_Sheet.dart';

class FinishEmployeeWorkController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  TextEditingController? causeController;

  TextEditingController? descriptionController;
  bool _isButtonDisabled = true;

  bool get isButtonDisabled => _isButtonDisabled;

  int _causeId = 0;

  int get causeId => _causeId;

  void onCauseTapped() {
    // FetchRefusingReasonsController _fetchReasonsController =
    // Get.put(FetchRefusingReasonsController());
    AppSheet.showDefaultSheet(
      SheetSelectCauseName(
        onConfirmed: (int id, String value) {
          causeController?.text = value;
          _causeId = id;
          // _fetchWorkTypeController.fetchAddJobInfo(parameters: FetchWorkTypeParameters(serviceId: id));
        },
      ),
    );
  }

  /// -------------- API CALLS --------------
  final FinishEmployeeApiRepo _finishEmployeeApiRepo =
      Get.put(FinishEmployeeApiRepo());

  DataState<bool> _dataState = const DataInitial<bool>();

  DataState<bool> get dataState => _dataState;

  Future<bool> finishEmployee(int employeeId) async {
    // Utils.showLoadingDialog();
    bool isDone = false;
    _dataState = const DataLoading();
    update();
    _dataState = await (_finishEmployeeApiRepo.fire(
      params: FinishEmployeeParams(
        employeeID: employeeId,
        finishWorkReasonID: _causeId,
        finishWorkReasonText: descriptionController!.text,
      ),
    )!);
    isDone = _dataState.data!;
    update();
    // Get.back();
    _onSuccess(isDone, message: _dataState.message ?? '');
    return isDone;
  }

  void _onSuccess(bool isDone, {required String message}) {
    printDM("isDone is $isDone");
    Get.back();
    if (isDone) {
      final MyEmployeesController myEmployeesController = Get.find();
      myEmployeesController.getMyEmployees().then((_) {
        Get.offAll(() => const CompanyBaseScreen());
      });
    }
    Utils.showDefaultSnackBar(title: message);
  }

  @override
  void onInit() {
    causeController = TextEditingController();
    causeController?.addListener(() {
      if (causeController!.text.isNotEmpty) {
        _isButtonDisabled = false;
        update();
      }
    });
    descriptionController = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    causeController?.dispose();
    descriptionController?.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
