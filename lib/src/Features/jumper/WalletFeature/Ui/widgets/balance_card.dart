part of 'widgets_wallet_imports.dart';

class BalanceCard extends StatelessWidget {
  final WalletController controller;
  final int type;

  const BalanceCard({
    Key? key,
    required this.controller,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WalletCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: CustomText(
              (type == 1 ? 'total_balance' : type == 2 ? "remainingAmount" : "withdrawnAmount"),
              fontSize: 14,
              color: Colors.white,
              fontWeight: FW.regular,
            ),
          ),
          10.7.ESH(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Builder(builder: (context) {
                String balance = type == 1 ? controller.dataState.data!.balance.toString()
                : type == 2 ? controller.dataState.data!.remainingAmount.toString() : controller.dataState.data!.withdrawnAmount.toString();

                return CustomText(
                  (balance != "") ? Utils.convertToMoney(balance) : "0",
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FW.semiBold,
                );
              }),
              const CustomText(
                'currency',
                fontSize: 14,
                color: Colors.white,
                fontWeight: FW.regular,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
