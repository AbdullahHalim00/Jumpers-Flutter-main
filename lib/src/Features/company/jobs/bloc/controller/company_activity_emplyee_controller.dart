import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/EmployeeActivityResponse.dart';

import '../../../../../Core/utils/storage_util.dart';

class CompanyActivityEmployeeController extends GetxController {
  final DataBase _dataBase = Get.find<DataBase>();

  EmployeeActivityResponse? employeeActivityResponse;

  getJobActivity(String job_id, String employee_id) async {
    Dio dioNew = Dio();
    dioNew.options.headers = {
      "Authorization": "Bearer ${_dataBase.restoreUserModel().apiToken}"
    };

    // log(_dataBase.restoreUserModel().apiToken);
    log(job_id);
    try {
      var response = await dioNew.post(
          'https://jumpersksa.com/api/job_employee_attendance',
          data: {"job_id": job_id, "employee_id": employee_id});
      log("${response.data}");
      employeeActivityResponse =
          EmployeeActivityResponse.fromJson(response.data);
      if (employeeActivityResponse!.status.toString() == "200") {
      } else {}
    } on Exception catch (e) {
      log(e.toString());
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // _timer.cancel();
    // TODO: implement dispose
    super.dispose();
  }
}
