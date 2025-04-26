import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/jumper/WalletFeature/Bloc/Model/transaction_history.dart';

class Wallet {
  late int balance;
  late int withdrawnAmount;
  late int remainingAmount;

  // late BankAccount account ;
  late List<TransactionHistory> transactions;

  Wallet({
    required this.balance,
    required this.withdrawnAmount,
    required this.remainingAmount,
    // required this.account,
    required this.transactions,
  });

  @override
  String toString() {
    return 'WalletModel{' +
        ' balance: $balance,' +
        // ' account: $account,' +
        ' done_wallets: $transactions,' +
        '}';
  }

  Wallet.fromMap(Map<String, dynamic> map) {
    balance = map['all_account'] ?? 0;
    printDM("balance is => $balance");

    remainingAmount = map['remaining_amount'] ?? 0;
    printDM("remaining_amount is => $remainingAmount");

    withdrawnAmount = map['withdrawn_amount'] ?? 0;
    printDM("withdrawn_amount is => $withdrawnAmount");
    // account= map['account'] ;
    // printDM("account is => $account");

    transactions = map['done_wallets'] != null
        ? List<TransactionHistory>.from(
            map['done_wallets'].map((x) => TransactionHistory.fromMap(x)))
        : [];
    printDM("transactions is => $transactions");
  }
}
