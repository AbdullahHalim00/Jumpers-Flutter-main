part of 'widgets_wallet_imports.dart';

class WithDrawButton extends StatelessWidget {
  const WithDrawButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WithdrawController _transactionController =
        Get.find<WithdrawController>();
    return GetBuilder<WithdrawController>(
        init: _transactionController,
        builder: (logic) {
          return WalletFooterButton(
            label: "confirm_transaction",
            onPressed: () {
              logic.withdraw();
            },
          );
        });
  }
}
