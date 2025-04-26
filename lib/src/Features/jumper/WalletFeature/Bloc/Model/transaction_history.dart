import 'package:jumper/src/Core/utils/utils.dart';

class TransactionHistory {
  late int id;
  late String transaction;
  late String date;
  late TransactionStatus transactionStatus;

  TransactionHistory({
    required this.id,
    required this.transaction,
    required this.date,
    required this.transactionStatus,
  });

  @override
  String toString() {
    return 'TransactionModel{' +
        ' id: $id,' +
        ' transaction: $transaction,' +
        ' date: $date,' +
        ' transaction_status: $transactionStatus,' +
        '}';
  }

  TransactionHistory.fromMap(Map<String, dynamic> map) {
    id = map['id'] ?? 0;
    printDM("id is => $id");
    transaction = map['transaction'] ?? "";
    printDM("transaction is => $transaction");
    date = map['date'] ?? "";
    printDM("date is => $date");
    transactionStatus = _getTransactionStatus(map['transaction_status'] ?? 0);
    printDM("transaction_status is => $transactionStatus");
  }

  TransactionStatus _getTransactionStatus(int status) {
    switch (status) {
      case 0:
        return TransactionStatus.withdraw;
      case 1:
        return TransactionStatus.deposit;

      default:
        return TransactionStatus.withdraw;
    }
  }
}

enum TransactionStatus {
  deposit,
  withdraw,
}
