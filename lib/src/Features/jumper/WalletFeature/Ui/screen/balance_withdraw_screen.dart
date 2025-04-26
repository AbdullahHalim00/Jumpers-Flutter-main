import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Features/jumper/WalletFeature/Bloc/Controller/withdraw_controller.dart';
import 'package:jumper/src/Features/jumper/WalletFeature/Ui/widgets/widgets_wallet_imports.dart';
import 'package:jumper/src/Ui/appbars/default_appbar.dart';
import 'package:jumper/src/Ui/scaffold/default_scaffold.dart';

class BalanceWithdrawScreen extends StatelessWidget {
  const BalanceWithdrawScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WithdrawController _withdrawController =
        Get.put(WithdrawController());

    return DefaultScaffold(
      appBar: AppBars.basic(
        title: 'balance_withdraw',
        isBack: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              children: const [
                BalanceWithdrawHeader(),
                WithdrawCard(),
                WithdrawFormFieldBuilder(),
              ],
            ),
          ),
          const WithDrawButton(),
        ],
      ),
    );
  }
}
