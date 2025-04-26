// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:jumper/src/Bloc/models/user_model.dart';
// import 'package:jumper/src/Core/resources/data_state.dart';
// import 'package:jumper/src/Core/utils/storage_util.dart';
// import 'package:jumper/src/Core/utils/utils.dart';
// import 'package:jumper/src/Features/jumper/AccountFeatures/ui/screens/imports_company_more.dart';
// import 'package:jumper/src/Features/jumper/WalletFeature/Bloc/Model/wallet_bank_model.dart';
// import 'package:jumper/src/Features/jumper/WalletFeature/Bloc/Params/save_bank_account_params.dart';
// import 'package:jumper/src/Features/jumper/WalletFeature/Bloc/Repo/select_bank_account_repo.dart';
//
// class SelectBankAccountController extends GetxController {
//   DataState<UserModel> _dataState = DataInitial<UserModel>();
//   DataState get dataState => _dataState;
//
//
//   // GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   // GlobalKey<FormState> get formKey => _formKey;
//   // TextEditingController? bankAccountNumberController;
//   // TextEditingController? iBanController;
//   // TextEditingController? swiftCodeController;
//
//   /// ******************************* Wallet *********************************
//
//   WalletBankModel ?  userWallet;
//   /// called in onInit
//   void _cachedUserWallet (){
//     userWallet=DataBase() .restoreUserModel().walletBank;
//   }
//   /// ******************************* Api Call *********************************
//
//   final SelectBankAccountRepository _selectBankAccountRepository =
//       Get.put(SelectBankAccountRepository());
//
//   void saveBankAccount(int bankId) async {
//     if (_formKey.currentState!.validate()) {
//       _dataState = const DataLoading();
//       Utils.showLoadingDialog();
//       _dataState = await _selectBankAccountRepository.selectAccount(
//         SaveBankAccountParams(
//             bankAccountTypeId: bankId ,
//           accountNumber: bankAccountNumberController!.text,
//           iban: iBanController!.text,
//           swiftCode: swiftCodeController!.text,
//         ),
//       )!;
//       if (_dataState is DataSuccess) {
//         DataBase().storeUserModel(dataState.data);
//         Get.offAll(()=>const AccountScreen());
//       }
//       Utils.closeDialog();
//       Utils.showToast(title: _dataState.message??"", state: UtilState.None);
//     }
//   }
//
//
//
//   @override
//   void onInit() {
//     _cachedUserWallet();
//     // bankAccountNumberController = TextEditingController();
//     // iBanController = TextEditingController();
//     // swiftCodeController = TextEditingController();
//     super.onInit();
//   }
//
//   @override
//   void dispose() {
//     // bankAccountNumberController?.dispose();
//     // iBanController?.dispose();
//     // swiftCodeController?.dispose();
//     super.dispose();
//   }
// }
