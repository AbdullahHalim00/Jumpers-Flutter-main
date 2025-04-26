import 'package:dio/dio.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/services/network/api_names.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Core/services/network/network_services.dart';
import 'package:jumper/src/Features/jumper/WalletFeature/Bloc/Params/save_bank_account_params.dart';

class SelectBankAccountService with ApiNames {
  final NetworkService _networkService = NetworkService();

  Future<Response> saveAccount(SaveBankAccountParams params) async {
    Response response;
    try {
      response = await _networkService.post(
          url: uRLSaveAccountSetting, body: params.toJson(), auth: true);
    } on NetworkDisconnectException {
      throw NetworkDisconnectException(networkDisconnectException);
    } on ServerSideException {
      throw ServerSideException(serverSideException);
    } on UnKnownException {
      throw UnKnownException(unKnownException);
    } catch (e) {
      throw UnKnownException(e.toString());
    }
    return response;
  }
}
