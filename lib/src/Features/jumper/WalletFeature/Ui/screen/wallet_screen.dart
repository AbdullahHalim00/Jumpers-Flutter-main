part of 'imports_wallet_screen.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WalletController _walletController = Get.put(WalletController());
    return DefaultScaffold(
      appBar: AppBars.basic(
        title: 'wallet',
        isBack: true,
      ),
      body: GetBuilder<WalletController>(
          init: _walletController,
          builder: (_) {
            return DataStatusBuilder(
              status: _.dataState,
              onDoneBuild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        BalanceCard(
                          controller: _walletController,
                          type: 1,
                        ),
                        10.ESH(),
                        BalanceCard(
                          controller: _walletController,
                          type: 2,
                        ),
                        10.ESH(),
                        BalanceCard(
                          controller: _walletController,
                          type: 3,
                        ),
                        46.ESH(),
                        TransactionHistoryBuilder(
                          controller: _walletController,
                        ),
                      ],
                    ),
                  ),
                  WalletFooterButton(
                    label: "balance_withdraw",
                    onPressed: _.navigateToWithdrawScreen,
                  ),
                ],
              ),
              onLoadingBuild: const LoadingBox(),
              onRedirectCallback: () => _.fetchWallet(),
            );
          }),
    );
  }
}
