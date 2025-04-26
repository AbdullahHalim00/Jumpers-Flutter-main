import 'dart:io';

import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/jumper/WalletFeature/Bloc/Params/withdraw_money_params.dart';
import 'package:jumper/src/Features/jumper/WalletFeature/Bloc/Service/withdraw_money_service.dart';

class WithdrawMoneyRepository {
  final WithdrawMoneyService _withdrawMoneyService =
      Get.put(WithdrawMoneyService());

  Future<DataState<String>>? withdraw(WithdrawMoneyParams params) async {
    printDM("Withdrawx 0");
    try {
      final httpResponse = await _withdrawMoneyService.withdraw(params);
      if (((httpResponse.statusCode == HttpStatus.ok) ||
              (httpResponse.statusCode == HttpStatus.created) ||
              (httpResponse.statusCode == HttpStatus.accepted)) &&
          (httpResponse.data['status'] ?? false)) {
        printDM("Withdrawx 1");

        if (httpResponse.data['message'] != null) {
          printDM("Withdrawx 2 ${httpResponse.data['message']}");

          return DataSuccess<String>(httpResponse.data['message']);
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
