part of 'widgets_wallet_imports.dart';

class WithdrawFormFieldBuilder extends StatelessWidget {
  const WithdrawFormFieldBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WithdrawController _transactionController =
        Get.find<WithdrawController>();
    return GetBuilder<WithdrawController>(
        init: _transactionController,
        builder: (_) {
          return Form(
            key: _.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  "amount",
                  padding: EdgeInsets.symmetric(vertical: 25.h),
                  fontSize: 16,
                  fontWeight: FW.medium,
                  color: AppColors.black,
                ),
                TextFieldDefault(
                  hint: "0.00",
                  suffixText: "currency".tr,
                  controller: _.moneyAmountController,
                  keyboardType: TextInputType.number,
                  validation: (value) => AppValidator.validate(
                    value,
                    type: ValidatorType.numeric,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
