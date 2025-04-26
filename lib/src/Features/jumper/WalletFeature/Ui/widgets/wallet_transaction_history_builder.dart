part of 'widgets_wallet_imports.dart';

class TransactionHistoryBuilder extends StatelessWidget {
  final WalletController controller;

  const TransactionHistoryBuilder({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              const CustomText(
                "transaction_history",
                fontSize: 14,
                fontWeight: FW.semiBold,
              ),
              const Spacer(),
              UnAvailableBuilder(
                child: DropdownButton<String>(
                  value: controller.historyDropDownValue,
                  hint: CustomText(
                    controller.historyDropDownValue,
                    fontSize: 14,
                    fontWeight: FW.semiBold,
                  ),
                  items: controller.historyDropDownValues
                      .map(
                        (value) => DropdownMenuItem(
                          child: CustomText(
                            value,
                            fontSize: 14,
                            fontWeight: FW.semiBold,
                          ),
                          value: value,
                        ),
                      )
                      .toList(),
                  onChanged: controller.onDropDownChanged,
                ),
              ),
            ],
          ),
          12.ESH(),
          Expanded(
            child: AnimatedWrapper(
              styles: WrapAnimationStyles.slide,
              index: controller.dataState.data!.transactions.length,
              child: ListView.builder(
                itemCount: controller.dataState.data!.transactions.length,
                itemBuilder: (context, index) {
                  final transaction =
                      controller.dataState.data!.transactions[index];
                  // final transaction = controller.transactionsFromDate[index];
                  return TransactionListTile(
                    transaction: transaction,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
