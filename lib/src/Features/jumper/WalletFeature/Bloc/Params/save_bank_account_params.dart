class SaveBankAccountParams {
  late int bankAccountTypeId;
  late String accountNumber;
  late String? iban;

  // late String  ?swiftCode;

  SaveBankAccountParams({
    required this.bankAccountTypeId,
    required this.accountNumber,
    this.iban,
    // this.swiftCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'bank_account_type_id': bankAccountTypeId,
      'account_number': accountNumber,
      if (iban?.trim().isNotEmpty ?? true) 'iban': iban,
      // if(swiftCode!=null) 'swift_code': swiftCode,
    };
  }
}
