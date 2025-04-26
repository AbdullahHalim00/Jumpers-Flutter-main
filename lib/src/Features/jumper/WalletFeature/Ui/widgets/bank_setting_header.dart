part of 'widgets_wallet_imports.dart';

class BankSettingHeader extends StatelessWidget {
  const BankSettingHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.only(bottom: 25.h, top: 9.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            'choose_your_account',
            fontSize: 14,
            fontWeight: FW.medium,
          ),
          11.ESH(),
          const CustomText(
            'choose_your_account_description',
            fontSize: 12,
            fontWeight: FW.regular,
          ),
        ],
      ),
    );
  }
}
