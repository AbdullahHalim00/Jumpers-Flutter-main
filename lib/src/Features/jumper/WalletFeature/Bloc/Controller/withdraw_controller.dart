import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/utils/storage_util.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/jumper/AccountFeatures/ui/screens/imports_account.dart';
import 'package:jumper/src/Features/jumper/WalletFeature/Bloc/Model/wallet_bank_model.dart';
import 'package:jumper/src/Features/jumper/WalletFeature/Bloc/Params/withdraw_money_params.dart';
import 'package:jumper/src/Features/jumper/WalletFeature/Bloc/Repo/withdraw_money_repo.dart';
import 'package:jumper/src/Features/jumper/WalletFeature/Ui/screen/imports_wallet_screen.dart';

class WithdrawController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController? moneyAmountController;
  DataState<String> _dataState = const DataInitial<String>();

  DataState get dataState => _dataState;

  /// ******************************* User Wallet *********************************

  WalletBankModel? userWallet;

  /// called in onInit
  void _cachedUserWallet() {
    userWallet = DataBase().restoreUserModel().walletBank;
  }

  /// navigate To [BankAccountSettingScreen] to edit your bank account
  void navigateToEditBankAccountSettings() {
    Get.to(() => const BankAccountSettingScreen());
  }

  /// ******************************* Api Call *********************************
  final WithdrawMoneyRepository _withdrawMoneyRepository =
      Get.put(WithdrawMoneyRepository());

  Future<void> withdraw() async {
    if (_formKey.currentState!.validate()) {
      if (_checkWithdrawProbability(
          amount: int.parse(moneyAmountController!.text))) {
        _dataState = const DataLoading();
        Utils.showLoadingDialog();
        _dataState = await _withdrawMoneyRepository.withdraw(
          WithdrawMoneyParams(
            money: moneyAmountController!.text,
          ),
        )!;
        _onSuccess(_dataState);
        Utils.closeDialog();
        Utils.showToast(title: _dataState.data!, state: UtilState.Success);
      }
    }
  }

  bool _checkWithdrawProbability({required int amount}) {
    // final double userBalance = 20.0;
    final int userBalance = DataBase().restoreUserModel().walletBank!.balance;
    if (userBalance < amount) {
      Utils.showToast(
        title: 'You don\'t have that much of money in your wallet',
        state: UtilState.Error,
      );
      return false;
    } else {
      return true;
    }
  }

  void _onSuccess(DataState state) {
    if (state is DataSuccess) {
      moneyAmountController?.clear();
      Get.off(() => const AccountScreen());
    }
  }

  @override
  void onInit() {
    _cachedUserWallet();
    moneyAmountController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    moneyAmountController?.dispose();
    super.dispose();
  }
}
