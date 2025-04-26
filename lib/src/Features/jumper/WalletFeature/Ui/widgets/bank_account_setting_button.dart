part of 'widgets_wallet_imports.dart';

class BankSettingsFooterButton extends StatelessWidget {
  const BankSettingsFooterButton({Key? key, required this.enteredInLogin}) : super(key: key);
  final bool enteredInLogin;

  @override
  Widget build(BuildContext context) {
    final _bankAccountController = Get.find<BankAccountsController>();

    return WalletFooterButton(
      label: enteredInLogin
        ? "start_now"
        : "save_data",
      onPressed: () {
        _bankAccountController.saveBankAccount();
      },
    );
  }
}
