import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/candidate_model.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Features/company/job_details/bloc/model/job_employees_model.dart';
import 'package:jumper/src/Features/company/job_details/bloc/repo/job_employees_repo.dart';
import 'package:jumper/src/Ui/cards/candidate_card.dart';

import '../../../../../Bloc/models/PaymentResponse.dart';
import '../../../../../Core/utils/storage_util.dart';
import '../../ui/screens/payment_webview.dart';

class JobEmployeesController extends GetxController {
  final int jobId;

  JobEmployeesController({required this.jobId});

  DataState<JobEmployeesModel> _dataState =
      const DataInitial<JobEmployeesModel>();

  DataState<JobEmployeesModel> get dataState => _dataState;

  final JobEmployeesRepository _jobEmployeesRepository =
      Get.put(JobEmployeesRepository());

  PaymentResponse? paymentResponse;
  final DataBase _dataBase = Get.put(DataBase());

  /// --------------- API CALL ------------------------

  Future<void> fetchEmployees({required int jobID}) async {
    _dataState = const DataLoading();
    update();
    _dataState = await (_jobEmployeesRepository.fetchEmployees(jobID))!;
    getAcceptedEmployee();
    update();
  }

  bool isCanPay = false;

  getAcceptedEmployee() {
    for (CandidateModel c in dataState.data!.acceptedEmployees) {
      if (c.candidateStatus == CandidateState.confirmed) {
        isCanPay = true;
      } else {
        isCanPay = false;
      }
    }
    if (dataState.data!.acceptedEmployees.isEmpty) {
      isCanPay = false;
    }
  }

  bool isLoading = false;

  payment(String jobId, BuildContext context) async {
    showDialog(
        context: context,
        builder: (_) => const Dialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.basicColor,
                ),
              ),
            ));

    Dio dioNew = Dio();
    dioNew.options.headers = {
      "Authorization": "Bearer ${_dataBase.restoreUserModel().apiToken}"
    };

    // log(_dataBase.restoreUserModel().apiToken);
    log(jobId);
    try {
      var response =
          await dioNew.post('https://jumpersksa.com/api/pay_order', data: {
        "job_id": jobId,
      });
      log("${response.data}");

      paymentResponse = PaymentResponse.fromJson(response.data);
      if (paymentResponse!.status.toString() == "200") {
        Get.to(
          () => PaymentWebView(
            url: paymentResponse!.data ?? "",
            job_id: int.parse(jobId),
          ),
        );
      } else {
        Navigator.pop(context);

        Get.snackbar(
          "Error",
          paymentResponse!.msg.toString(),
          colorText: Colors.white,
          backgroundColor: Colors.red,
          icon: const Icon(Icons.error),
        );
      }
    } on Exception catch (e) {
      log(e.toString());
    }

    update();
  }

  @override
  void onInit() {
    fetchEmployees(jobID: jobId);
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
