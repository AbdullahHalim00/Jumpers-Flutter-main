part of 'widgets_wallet_imports.dart';
// class BankAccountsListBuilder extends StatelessWidget {
//   const BankAccountsListBuilder({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final BankAccountsController _fetchBankAccountsController = Get.find<BankAccountsController>();
//     return GetBuilder<BankAccountsController>(
//         init: _fetchBankAccountsController,
//         builder: (logic) {
//       return DataStatusBuilder(
//         status: logic.dataState,
//         // onDoneBuild: SizedBox(
//         //   height: 150,
//         //   child: ListView.builder(
//         //     scrollDirection: Axis.horizontal,
//         //     itemBuilder: (context, index) {
//         //       final account = logic.dataState.data![index];
//         //       return BankAccountItem(
//         //         account: account,
//         //         onTap: () => logic.toggleSelected(account),
//         //       );
//         //     },
//         //   ),
//         // ),
//         onDoneBuild:
//         (logic.dataState is !DataSuccess) ?0.0.ESW() :
//         Wrap(
//           spacing: 16.w,
//           runSpacing: 16.h,
//           children: logic.dataState.data!
//               .map(
//                 (account) {
//                   return BankAccountItem(
//               account: account,
//             );
//                 },
//           )
//               .toList(),
//         ),
//       );
//     });
//   }
// }
