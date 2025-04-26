import 'package:jumper/src/Core/utils/utils.dart';

// "withdrawn_amount": 7,
// "remaining_amount": -7,

class WalletBankModel {
  late int bankAccountTypeId;
  late String bankAccountTypeTitle;
  late String bankAccountTypeImage;
  late String accountNumber;
  late String iban;
  late String swiftCode;
  late int balance;

  // late int  withdrawn_amount;
  // late int  remaining_amount;

  WalletBankModel({
    required this.bankAccountTypeId,
    required this.bankAccountTypeTitle,
    required this.bankAccountTypeImage,
    required this.accountNumber,
    required this.iban,
    required this.swiftCode,
    required this.balance,
    // required this.withdrawn_amount,
    // required this.remaining_amount,
  });

  Map<String, dynamic> toJson() {
    return {
      'bank_account_type_id': bankAccountTypeId,
      'bank_account_type_title': bankAccountTypeTitle,
      'bank_account_type_image': bankAccountTypeImage,
      'account_number': accountNumber,
      'iban': iban,
      'swift_code': swiftCode,
      'all_account': balance,
    };
  }

  WalletBankModel.fromJson(Map<String, dynamic> map) {
    printDM('WalletBankModel.fromJson... $map');
    bankAccountTypeId = map['bank_account_type_id'] ?? 0;
    printDM("bankAccountTypeId is => $bankAccountTypeId");
    bankAccountTypeTitle = map['bank_account_type_title'] ?? '';
    printDM("bank_account_type_title is => $bankAccountTypeTitle");
    bankAccountTypeImage = map['bank_account_type_image'] ?? '';
    printDM("bank_account_type_image is => $bankAccountTypeImage");
    balance = map['all_account'] ?? 0;
    printDM("all_account is => $balance");
    accountNumber = map['account_number'] ?? "";
    printDM("accountNumber is => $accountNumber");

    (map['iban'] is int)
        ? iban = map['iban'] ?? 0.toString()
        : iban = map['iban'] ?? "";
    printDM("iban is => $iban");

    (map['swift_code'] is int)
        ? swiftCode = map['swift_code'] ?? 0.toString()
        : swiftCode = map['swift_code'] ?? "";
    printDM("swiftCode is => $swiftCode");
  }
}
