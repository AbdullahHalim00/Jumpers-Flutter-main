import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/user_model.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/jumper/WalletFeature/Bloc/Params/save_bank_account_params.dart';
import 'package:jumper/src/Features/jumper/WalletFeature/Bloc/Service/select_bank_account_service.dart';

class SelectBankAccountRepository {
  final SelectBankAccountService _bankAccountService =
      Get.put(SelectBankAccountService());

  Future<DataState<UserModel>>? selectAccount(
      SaveBankAccountParams params) async {
    try {
      final httpResponse = await _bankAccountService.saveAccount(params);
      log('httpResponse ${httpResponse.data}');
      log('params $params');
      if (((httpResponse.statusCode == HttpStatus.ok) ||
              (httpResponse.statusCode == HttpStatus.created) ||
              (httpResponse.statusCode == HttpStatus.accepted)) &&
          (httpResponse.data['status'] ?? false)) {
        if (httpResponse.data['data'] != null) {
          UserModel userModel = UserModel.fromJson(httpResponse.data['data']);
          printDM(" NESS${httpResponse.data['message']}");
          return DataSuccess<UserModel>(userModel,
              message: httpResponse.data['message']);
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
