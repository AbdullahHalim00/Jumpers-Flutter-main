part of 'widgets_wallet_imports.dart';

class BankAccountSettingsBodyBuilder extends StatelessWidget {
  const BankAccountSettingsBodyBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bankAccountController = Get.find<BankAccountsController>();

    return GetBuilder<BankAccountsController>(
        init: _bankAccountController,
        builder: (logic) {
          return Form(
            key: logic.formKey,
            // autovalidateMode: AutovalidateMode.always,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DataStatusBuilder(
                  status: logic.dataState,
                  onLoadingBuild: const LoadingBox(heightRatio: 0.4),
                  onDoneBuild: (logic.dataState is! DataSuccess)
                      ? 0.0.ESW()
                      : Wrap(
                          spacing: 16.w,
                          runSpacing: 16.h,
                          children: logic.dataState.data!.map(
                            (e) {
                              return BankAccountItem(
                                account: e,
                                isSelected: logic.userWalletId == e.id,
                                onTap: () {
                                  logic.setUserWalletId(e.id);
                                  logic.changeIsBankView(
                                      e.isBank == 1 ? true : false);
                                },
                              );
                            },
                          ).toList(),
                        ),
                  //...
                ),
                CustomText(
                  "transfer_to",
                  padding: EdgeInsets.symmetric(vertical: 18.h),
                  fontSize: 16,
                  fontWeight: FW.medium,
                ),
                TextFieldDefault(
                  hint: "account_number",
                  controller: logic.bankAccountNumberController,
                  keyboardType: TextInputType.number,
                  validation: (value) => AppValidator.validate(
                    value,
                    type: ValidatorType.bankAccount,
                  ),
                  isRequired: true,
                ),
                if (logic.isBank)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        "IBAN",
                        padding: EdgeInsets.symmetric(vertical: 18.h),
                        fontSize: 16,
                        fontWeight: FW.medium,
                      ),
                      TextFieldDefault(
                        hint: "Example: SA45 0000 0000 0000 0000",
                        controller: logic.iBanController,
                        isRequired: true,
                        keyboardType: TextInputType.visiblePassword,
                        validation: (value) => AppValidator.validate(
                          value,
                          type: ValidatorType.iBan,
                        ),
                      ),
                      15.0.ESH()
                      // CustomText(
                      //   "Swift Code",
                      //   padding: EdgeInsets.symmetric(vertical: 18.h),
                      //   fontSize: 16,
                      //   fontWeight: FW.medium,
                      // ),
                      // TextFieldDefault(
                      //   hint: "-- --- -------------",
                      //   isRequired: true,
                      //   controller: logic.swiftCodeController,
                      //   keyboardType: TextInputType.number,
                      //   validation: (value) => AppValidator.validate(
                      //     value,
                      //     type: ValidatorType.numeric,
                      //   ),
                      // ),
                    ],
                  ),
                // const BuildIfIsBank(),
              ],
            ),
          );
        });
  }
}

// class BuildIfIsBank extends StatelessWidget {
//   const BuildIfIsBank({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<BankAccountsController>(builder: (logic) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomText(
//             "IBAN",
//             padding: EdgeInsets.symmetric(vertical: 18.h),
//             fontSize: 16,
//             fontWeight: FW.medium,
//           ),
//           TextFieldDefault(
//             hint: "-- --- -------------",
//             controller: logic.iBanController,
//             keyboardType: TextInputType.number,
//             validation: (value) => AppValidator.validate(
//               value,
//               type: ValidatorType.numeric,
//             ),
//           ),
//           CustomText(
//             "Swift Code",
//             padding: EdgeInsets.symmetric(vertical: 18.h),
//             fontSize: 16,
//             fontWeight: FW.medium,
//           ),
//           TextFieldDefault(
//             hint: "-- --- -------------",
//             controller: logic.swiftCodeController,
//             keyboardType: TextInputType.number,
//             validation: (value) => AppValidator.validate(
//               value,
//               type: ValidatorType.numeric,
//             ),
//           ),
//         ],
//       );
//     });
//   }
// }
