import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/employee_model.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Features/company/EmployeesFeature/bloc/repo/my_employees_repo.dart';

class MyEmployeesController extends GetxController {
  /// -------------- API CAll ----------------

  DataState<List<EmployeeModel>> _dataState = const DataInitial();

  DataState<List<EmployeeModel>> get dataState => _dataState;

  final MyEmployeesRepository _myEmployeesRepository =
      Get.put(MyEmployeesRepository());

  Future<void> getMyEmployees() async {
    _dataState = const DataLoading();
    update();

    /// replace
    // final JobEmployeesRepository _jobEmp =
    // Get.put(JobEmployeesRepository());
    // await(_jobEmp.fetchEmployees(43))!.then((value) {
    //   _dataState=DataSuccess<List<EmployeeModel>>(value.data!.allEmployees );
    // } );
    /// to
    _dataState = (await _myEmployeesRepository.getMyEmployees())!;

    update();
    // printDM("my employee is ${_dataState.data!.length}");
  }

  @override
  void onInit() {
    getMyEmployees();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
