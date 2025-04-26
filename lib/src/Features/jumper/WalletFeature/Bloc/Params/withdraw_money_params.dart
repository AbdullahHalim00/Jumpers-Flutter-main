class WithdrawMoneyParams {
  final String money;

  WithdrawMoneyParams({
    required this.money,
  });

  Map<String, dynamic> toMap() {
    return {
      'money': money,
    };
  }
}
