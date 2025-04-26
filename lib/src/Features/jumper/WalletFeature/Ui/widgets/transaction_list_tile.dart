part of 'widgets_wallet_imports.dart';

class TransactionListTile extends StatelessWidget {
  final TransactionHistory transaction;

  const TransactionListTile({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // icon
          Builder(builder: (context) {
            switch (transaction.transactionStatus) {
              case TransactionStatus.deposit:
                return Image.asset(
                  Assets.deposit,
                  height: 24,
                  width: 24,
                );
              case TransactionStatus.withdraw:
                return Image.asset(
                  Assets.withdraw,
                  height: 24,
                  width: 24,
                );
              // case TransactionStatus.none:
              //   return CustomText.subtitle("---",isBold: true,fontSize: 10,);
            }
          }),
          Spacer(),
          // data
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.subtitle(transaction.transaction,
                  fontSize: 11, color: AppColors.black),
              10.ESH(),
              CustomText.subtitle(
                transaction.date,
                fontSize: 9,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
