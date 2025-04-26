import 'dart:io';

import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Features/jumper/WalletFeature/Bloc/Model/bank_account.dart';
import 'package:jumper/src/Features/jumper/WalletFeature/Bloc/Service/fetch_bank_accounts_service.dart';

class FetchBankAccountsRepository {
  final FetchBankAccountsService _fetchBankAccountsApiService =
      Get.put(FetchBankAccountsService());

  Future<DataState<List<BankAccount>>>? fetchBankAccounts() async {
    try {
      final httpResponse =
          await _fetchBankAccountsApiService.fetchBankAccounts();
      if (((httpResponse.statusCode == HttpStatus.ok) ||
              (httpResponse.statusCode == HttpStatus.created) ||
              (httpResponse.statusCode == HttpStatus.accepted)) &&
          (httpResponse.data['status'] ?? false)) {
        if (httpResponse.data['data'] != null) {
          List<BankAccount> accounts = [];

          for (var item in httpResponse.data['data']) {
            accounts.add(BankAccount.fromMap(item));
          }

          return DataSuccess<List<BankAccount>>(accounts);
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
