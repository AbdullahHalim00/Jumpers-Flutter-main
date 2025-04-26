part of 'imports_wallet_screen.dart';

class BankAccountSettingScreen extends StatelessWidget {
  const BankAccountSettingScreen({Key? key, this.enteredInLogin = false, this.canGoBack = true}) : super(key: key);
  final bool enteredInLogin;
  final bool canGoBack;

  @override
  Widget build(BuildContext context) {
    final BankAccountsController _fetchBankAccountsController = 
        Get.put(BankAccountsController(isEdit: !enteredInLogin));
    // final SelectBankAccountController _selectBankAccountController =
    //     Get.put(SelectBankAccountController());
    return DefaultScaffold(
      appBar: AppBars.basic(
        title: 'bank_account_settings',
        isBack: !enteredInLogin && canGoBack,
        actions: enteredInLogin
          ? [
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: const CustomText("3/3"),
            ),
          ),
        ]: null,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: CustomListView(
              children: [
                BankSettingHeader(),
                // BankAccountsListBuilder(),
                BankAccountSettingsBodyBuilder(),
              ],
            ),
          ),
          BankSettingsFooterButton(
            enteredInLogin: enteredInLogin
          ),
        ],
      ),
    );
  }
}
