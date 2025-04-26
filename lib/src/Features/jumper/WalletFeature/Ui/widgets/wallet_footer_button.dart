part of 'widgets_wallet_imports.dart';

class WalletFooterButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const WalletFooterButton(
      {Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomRoundedButton(
      onPressed: onPressed,
      backgroundColor: AppColors.secondary,
      child: CustomText(
        label,
        fontSize: 14,
        fontWeight: FW.medium,
        color: AppColors.white,
      ),
    );
  }
}
