import 'dart:io';

import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/employee_model.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Features/company/EmployeesFeature/bloc/services/my_fav_employee_api_service.dart';

/// NEEDS TO BE REVIEWED
class MyFavEmployeesRepository {
  final MyFavEmployeesApiService _myEmployeesApiService =
      Get.put(MyFavEmployeesApiService());

  Future<DataState<List<EmployeeModel>>>? getMyFavEmployees() async {
    try {
      final httpResponse = await _myEmployeesApiService.getMyFavEmployees();

      if (((httpResponse.statusCode == HttpStatus.ok) ||
              (httpResponse.statusCode == HttpStatus.created) ||
              (httpResponse.statusCode == HttpStatus.accepted)) &&
          (httpResponse.data['status'] ?? false)) {
        if (httpResponse.data["data"] != null) {
          List<EmployeeModel> employees = [];
          for (var item in (httpResponse.data['data'])) {
            employees.add(EmployeeModel.fromMap(item));
          }
          return DataSuccess<List<EmployeeModel>>(employees);
        } else {
          return DataFailed(ErrorModel(
              errorTitle: httpResponse.data['message'] ?? '',
              errorType: ErrorType.dataEmpty));
        }
      }

      return DataFailed(ErrorModel(
          errorTitle: httpResponse.data['message'] ?? '',
          errorType: ErrorType.unKnown));
    } on NetworkDisconnectException {
      return DataFailed(ErrorModel(
          errorTitle: networkDisconnectException,
          errorType: ErrorType.networkConnection));
    } on ServerSideException {
      return DataFailed(ErrorModel(
          errorTitle: serverSideException, errorType: ErrorType.serverSide));
    } on UnKnownException {
      return DataFailed(ErrorModel(
          errorTitle: unKnownException, errorType: ErrorType.unKnown));
    } catch (e) {
      return DataFailed(
          ErrorModel(errorTitle: '$e', errorType: ErrorType.unKnown));
    }
  }
}
