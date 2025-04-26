// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/user_model.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/utils/storage_util.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/jumper/AccountFeatures/ui/screens/imports_account.dart';
import 'package:jumper/src/Features/jumper/WalletFeature/Bloc/Model/bank_account.dart';
import 'package:jumper/src/Features/jumper/WalletFeature/Bloc/Model/wallet_bank_model.dart';
import 'package:jumper/src/Features/jumper/WalletFeature/Bloc/Params/save_bank_account_params.dart';
import 'package:jumper/src/Features/jumper/WalletFeature/Bloc/Repo/fetch_bank_accounts_repo.dart';
import 'package:jumper/src/Features/jumper/WalletFeature/Bloc/Repo/select_bank_account_repo.dart';

import '../../../../../Core/constants/decorations/app_durations.dart';
import '../../../BaseFeature/ui/screens/imports_jumper_base .dart';

class BankAccountsController extends GetxController {
  final bool isEdit;
  BankAccountsController({this.isEdit = true});
  
  DataState<List<BankAccount>> _dataState =
      const DataInitial<List<BankAccount>>();
      

  DataState<List<BankAccount>> get dataState => _dataState;

  TextEditingController? bankAccountNumberController;
  TextEditingController? iBanController;

  // TextEditingController? swiftCodeController;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  WalletBankModel? userWallet;
  int userWalletId = 0;

  /// called in onInit
  void _cachedUserWallet() async{
    await fetchAccounts();
    final user = DataBase().restoreUserModel();
    log('user from _cachedUserWallet ${user.toJson()}');
    userWallet = user.walletBank;
    userWallet ??= WalletBankModel(
        bankAccountTypeId: 0,
        bankAccountTypeTitle: '',
        bankAccountTypeImage: '',
        accountNumber: '',
        iban: '',
        swiftCode: '',
        balance: 0
    );
    if(userWallet?.accountNumber.isEmpty ?? true)
      userWallet?.accountNumber = user.banckAccountNumber;
    userWalletId = userWallet?.bankAccountTypeId ?? 0;
    
    final _bank = _dataState.data?.where((e) => e.id == userWalletId );
    if(_bank?.isNotEmpty ?? false){
      isBank = _bank!.first.isBank == 1;
    }

    log('userWallet.....${userWallet?.toJson()} \nuser ${user.toString()}');

    bankAccountNumberController = TextEditingController(text: userWallet?.accountNumber ?? "");
    iBanController = TextEditingController(text: 
      (userWallet?.iban.isNotEmpty ?? true)
      ? userWallet?.iban
      : user.ipanNumber);
    // swiftCodeController = TextEditingController(text: userWallet?.swiftCode ?? "");
    printDM("CACHED ${userWallet?.accountNumber}+ ${userWallet?.iban}+ ${user.ipanNumber}+ ${iBanController!.text}+ ${userWallet?.swiftCode}");
    update();
  }

  void setUserWalletId(int id) {
    userWalletId = id;
    update();
  }

  /// ************************ API CALL ***********************

  final FetchBankAccountsRepository _fetchBankAccountsRepository =
      FetchBankAccountsRepository();

  void _setCachedAccountData() {
    if (userWallet != null) {
      if (userWallet?.accountNumber != "")
        bankAccountNumberController =
            TextEditingController(text: userWallet?.accountNumber);
      if (userWallet?.iban != "")
        iBanController = TextEditingController(text: "${userWallet?.iban}");
      // if (userWallet?.swiftCode!="") swiftCodeController = TextEditingController(text:userWallet?.swiftCode);
    }
  }

  Future<void> fetchAccounts() async {
    _dataState = const DataLoading();
    // fakeRequest();
    _dataState = await _fetchBankAccountsRepository.fetchBankAccounts()!;
    printDM("DDDLIST${dataState.data}");
    update();
  }

  /// ******************************* SelectBank Api Call *********************************
  DataState<UserModel> _selectDataState = DataInitial<UserModel>();

  DataState get selectDataState => _selectDataState;
  final SelectBankAccountRepository _selectBankAccountRepository =
      Get.put(SelectBankAccountRepository());

  final DataBase _dataBase = Get.find<DataBase>();

  void saveBankAccount() async {
    if (_formKey.currentState!.validate()) {
      try{
        log('isEdit.... $isEdit');
        _selectDataState = const DataLoading();
        Utils.showLoadingDialog();
        _selectDataState = await _selectBankAccountRepository.selectAccount(
          SaveBankAccountParams(
            bankAccountTypeId: userWalletId,
            accountNumber: bankAccountNumberController!.text.trim(),
            iban: iBanController!.text.trim().toUpperCase(),
            // swiftCode: swiftCodeController!.text,
          ),
        )!;
        if (_selectDataState is DataSuccess) {
          if(!isEdit){
            _dataBase.storeUserModel(_selectDataState.data!);
            _dataBase.loginUser();
            Get.offAll(
              () => const JumperBaseScreen(),
              transition: Transition.fade,
              duration: AppDurations.mainTransition,
            );
          }else{
            printDM("_selectDataState.data!.toJson() ${_selectDataState.data!.toJson()}");
            DataBase().storeUserModel(
              _selectDataState.data!
            );
            log('DataBase().storeUserModel;');
            // Get.offAll(() => const AccountScreen());
            // Get.offAll(const AccountScreen());
            Get.back();
            Get.back();
            Utils.showToast(
                title: _selectDataState.message ?? "", state: UtilState.None);
          }
        } else {
          Utils.showToast(
              title: _selectDataState.error!.errorTitle ?? "",
              state: UtilState.Error);
        }
        Utils.closeDialog();
      }catch(_){
        log('ERROR $_');
      }
    }
  }

  bool isBank = false;

  /// localStorage
  void changeIsBankView(bool newValue) {
    isBank = newValue;
    update();
  }

  // bool isSelected (BankAccount account){
  //   final localBankId =  userWallet?.bankAccountTypeId;
  //   return localBankId!=null && localBankId==account.id;
  // }
  //  void toggleSelected(BankAccount account) {
  //    if (isSelected(account)){
  //      isSelected(account) = false ;
  //    }
  //    else {
  //      isSelected(account) = true ;
  //    }
  //   update();
  // }

  void _fetchIsBank() {
    isBank = (DataBase().restoreUserModel().walletBank?.iban != "") &&
        (DataBase().restoreUserModel().walletBank?.swiftCode != "");
    printDM("ISBANK $isBank");
    update();
  }

  @override
  void onInit() {
    // bankAccountNumberController = TextEditingController();
    // iBanController = TextEditingController();
    // swiftCodeController = TextEditingController();
    _cachedUserWallet();
    _fetchIsBank();
    _setCachedAccountData();
  }

  @override
  void dispose() {
    bankAccountNumberController?.dispose();
    iBanController?.dispose();
    // swiftCodeController?.dispose();
    super.dispose();
  }
}
