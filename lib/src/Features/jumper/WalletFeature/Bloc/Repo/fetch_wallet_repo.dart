import 'dart:io';

import 'package:get/get.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Features/jumper/WalletFeature/Bloc/Model/wallet.dart';
import 'package:jumper/src/Features/jumper/WalletFeature/Bloc/Service/fetch_wallet_service.dart';

class FetchWalletRepository {
  final FetchWalletService _fetchWalletApiService =
      Get.put(FetchWalletService());

  Future<DataState<Wallet>>? fetchWallet() async {
    // try {
    final httpResponse = await _fetchWalletApiService.fetchWallet();
    if (((httpResponse.statusCode == HttpStatus.ok) ||
            (httpResponse.statusCode == HttpStatus.created) ||
            (httpResponse.statusCode == HttpStatus.accepted)) &&
        (httpResponse.data['status'] ?? false)) {
      if (httpResponse.data['data'] != null) {
        Wallet wallet = Wallet.fromMap(httpResponse.data['data']);
        return DataSuccess<Wallet>(wallet);
      } else {
        return DataFailed(ErrorModel(
            errorTitle: httpResponse.data['message'] ?? '',
            errorType: ErrorType.dataEmpty));
      }
    }
    return DataFailed(ErrorModel(
        errorTitle: httpResponse.data['message'] ?? '',
        errorType: ErrorType.unKnown));
    // } on NetworkDisconnectException {
    //   return DataFailed(ErrorModel(errorTitle: networkDisconnectException,errorType: ErrorType.networkConnection));
    // } on ServerSideException {
    //   return DataFailed(ErrorModel(errorTitle: serverSideException,errorType: ErrorType.serverSide));
    // } on UnKnownException {
    //   return DataFailed(ErrorModel(errorTitle: unKnownException,errorType: ErrorType.unKnown));
    // } catch (e) {
    //   return DataFailed(ErrorModel(errorTitle: '$e',errorType: ErrorType.unKnown));
    // }
  }
}
