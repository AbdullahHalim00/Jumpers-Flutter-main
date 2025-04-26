part of 'widgets_wallet_imports.dart';

class WithdrawCard extends StatelessWidget {
  const WithdrawCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WithdrawController _walletController = Get.find<WithdrawController>();
    return GetBuilder<WithdrawController>(
        init: _walletController,
        builder: (_) {
          final account = _.userWallet;
          return WalletCard(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ImageNetwork(
                      url: account?.bankAccountTypeImage,
                      width: 40.h,
                      height: 40.h,
                    ),
                    16.ESW(),
                    CustomText(
                      account!.bankAccountTypeTitle,
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FW.medium,
                    ),
                    const Spacer(),
                    CustomRoundedButton(
                      height: 25.h,
                      backgroundColor: AppColors.white,
                      child: CustomText(
                        "edit",
                        fontSize: 10,
                        color: AppColors.black,
                        fontWeight: FW.medium,
                      ),
                      onPressed: () {
                        _.navigateToEditBankAccountSettings();
                      },
                    ),
                  ],
                ),
                28.ESH(),
                CustomText(
                  Utils.obsecureCardNumber(
                    account.accountNumber,
                  ),
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FW.regular,
                ),
              ],
            ),
          );
        });
  }
}
