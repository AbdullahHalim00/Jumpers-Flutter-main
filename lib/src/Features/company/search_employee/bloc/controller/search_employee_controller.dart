import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/employee_model.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/company/EmployeesFeature/bloc/controller/my_employees_controller.dart';

class SearchEmployeeController extends GetxController {
  late TextEditingController searchController;

  DataState<List<EmployeeModel?>> _dataState =
      const DataInitial<List<EmployeeModel?>>();

  DataState<List<EmployeeModel?>> get dataState => _dataState;

  final MyEmployeesController _employeesController = Get.find();

  List<EmployeeModel> _employeesData = [];

  void _getMyEmployees() {
    _employeesData = _employeesController.dataState.data ?? [];
  }

  List<EmployeeModel>? _searchedList = [];

  List<EmployeeModel>? get searchedList => _searchedList;

  String? _displayedName;

  String? get displayedName => _displayedName;

  Future<void> onSearchSubmitted(String value) async {
    _dataState = const DataLoading();
    update();
    //-----
    if (value != "") {
      await Future.delayed(const Duration(seconds: 1));
      _searchedList = (_employeesData.where((element) {
        return element.name.contains(value);
      }).toList());
    }

    _dataState = DataSuccess(_searchedList ?? []);
    _displayedName = value;
    printDM("_displayedName $_displayedName");
    update();

    //-----
    //
    // Future.delayed(const Duration(seconds: 1)).then((_) {
    //   debugPrint("value is => $value");
    //   update();
    // });
  }

  void onCancel() {
    _searchedList?.clear();
    _dataState = DataSuccess(_searchedList ?? []);
    update();
  }

  void onChanged(String value) {}

  @override
  void onInit() {
    _getMyEmployees();
    searchController = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    searchController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
