import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/storage/storage_constants.dart';
import 'package:jumper/src/Core/utils/storage_util.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/jumper/WalletFeature/Bloc/Model/transaction_history.dart';
import 'package:jumper/src/Features/jumper/WalletFeature/Bloc/Model/wallet.dart';
import 'package:jumper/src/Features/jumper/WalletFeature/Bloc/Model/wallet_bank_model.dart';
import 'package:jumper/src/Features/jumper/WalletFeature/Bloc/Repo/fetch_wallet_repo.dart';
import 'package:jumper/src/Features/jumper/WalletFeature/Ui/screen/balance_withdraw_screen.dart';
import 'package:jumper/src/Features/jumper/WalletFeature/Ui/screen/imports_wallet_screen.dart';

class WalletController extends GetxController {
  final GetStorage _box = GetStorage();

  DataState<Wallet> _dataState = const DataInitial<Wallet>();

  DataState<Wallet> get dataState => _dataState;

  /// ************************ Cached Wallet ***********************
  WalletBankModel? userWallet;

  /// called in onInit
  void _cachedUserWallet() {
    userWallet = DataBase().restoreUserModel().walletBank;
  }

  void navigateToWithdrawScreen() {
    if (userWallet != null && userWallet?.accountNumber != "") {
      printDM("true");
      Get.to(() => const BalanceWithdrawScreen());
    } else {
      printDM("false");
      Utils.showToast(
        title: "سيتم توجيهك أولا لإضافة حسابك البنكي",
        state: UtilState.Warning,
      );
      Future.delayed(const Duration(seconds: 1)).then((_) {
        Get.to(() => const BankAccountSettingScreen());
      });
    }
  }

  /// ************************ History DropDown ***********************
  String _historyDropDownValue = "";

  String get historyDropDownValue => _historyDropDownValue;

  void _getCachedHistoryDropDownValue() {
    _historyDropDownValue = _box.read(stgHistoryFilerDropDownValue) ?? "today";
  }

  final List<String> _historyDropDownValues = [
    "today",
    "last_week",
    "last_month",
    "last_year",
    "all"
  ];

  List<String> get historyDropDownValues => _historyDropDownValues;

  // ************************ Date ***********************

  void onDropDownChanged(String? value) {
    _historyDropDownValue = value ?? "today";
    _box.write(stgHistoryFilerDropDownValue, value).then((_) {
      // changeViewedTransactionHistory(_historyDropDownValue);
    });
    update();
  }

  /// ************************ History DropDown ***********************

  /// ************************ API CALL ***********************

  final FetchWalletRepository _fetchWalletRepository = FetchWalletRepository();

  // int _convertDropDownValuesToDays (int diffDays){
  //   switch (_historyDropDownValue) {
  //     case "today":
  //       return 0;
  //     case "last_week":
  //       return 7;
  //     case "last_month":
  //       return 30;
  //     case "last_year":
  //       return 365;
  //     case "all":
  //       return 0;
  //     default:
  //       return 0;
  //   }
  // }
  // List<TransactionHistory> get transactionsFromDate  {
  //  final l =    txHistory.where((transaction) {
  //     final date = DateTime.parse(transaction.date);
  //     final today = DateTime.now();
  //     final diff = today.difference(date);
  //     final diffDays = diff.inDays;
  //     return diffDays <= _convertDropDownValuesToDays(diffDays);
  //
  //   }).toList();
  //  update();
  //  printDM("l is $l");
  //   return l ;
  // }

  List<TransactionHistory> txHistory = [];

  Future<void> fetchWallet() async {
    _dataState = const DataLoading();
    // fakeRequest();
    _dataState = await _fetchWalletRepository.fetchWallet()!;
    _dataState is DataSuccess
        ? txHistory = _dataState.data!.transactions
        : txHistory = [];
    update();
  }

  fakeRequest() {
    _dataState = DataSuccess<Wallet>(
      Wallet(
        balance: 2500000,
        remainingAmount: 222,
        withdrawnAmount: 222,
        // account: BankAccount(
        //   id: 0,
        //   cardNumber: "256 222  8541  2522",
        //   image: "https://i0.wp.com/beraportal.com/wp-content/uploads/2021/02/National-Bank-of-EgyptNBE.png?fit=315%2C370&ssl=1",
        //   name: "Ahly Bank",
        //   isActive: true,
        // ),
        transactions: [
          TransactionHistory(
            id: 0,
            transaction: "تم ايداع مبلغ بقيمة 122,200 ريال سعودي لوظيفة رقم ",
            date: "2022-07-30 18:59:35.473222",
            transactionStatus: TransactionStatus.deposit,
          ),
          TransactionHistory(
            id: 1,
            transaction: "تم سحب  مبلغ بقيمة 122,200 ريال سعودي لوظيفة رقم ",
            date: "2022-06-12 20:59:35.473222",
            transactionStatus: TransactionStatus.withdraw,
          ),
          TransactionHistory(
            id: 2,
            transaction: "تم ايداع مبلغ بقيمة 122,200 ريال سعودي لوظيفة رقم ",
            date: "2022-02-30 20:59:35.473222",
            transactionStatus: TransactionStatus.withdraw,
          ),
        ],
      ),
    );
  }

  @override
  void onInit() {
    _cachedUserWallet();
    _getCachedHistoryDropDownValue();
    fetchWallet();
  }
}
