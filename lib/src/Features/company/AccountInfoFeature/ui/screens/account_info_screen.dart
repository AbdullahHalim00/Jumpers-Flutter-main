import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Features/company/AccountInfoFeature/bloc/controller/account_info_controller.dart';
import 'package:jumper/src/Features/company/AccountInfoFeature/ui/widgets/account_info_item.dart';
import 'package:jumper/src/Ui/animation/animated_wrapper.dart';
import 'package:jumper/src/Ui/appbars/default_appbar.dart';
import 'package:jumper/src/Ui/listview/custom_listview.dart';
import 'package:jumper/src/Ui/scaffold/default_scaffold.dart';
import 'package:jumper/src/Ui/spaces_and_dividers/custom_divider.dart';

class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: AppBars.basic(
        title: "account_info".tr,
      ),
      body: GetBuilder<AccountInfoController>(
          init: AccountInfoController(),
          builder: (_) {
            return AnimatedWrapper(
              index: 3,
              child: CustomListView(
                children: [
                  AccountInfoItem(
                    label: "company_or_organization_name".tr,
                    data: _.name,
                  ),
                  XDivider.semiFaded(),
                  AccountInfoItem(
                    label: "phone_number".tr,
                    data: _.phone,
                  ),
                  XDivider.semiFaded(),
                  AccountInfoItem(
                    label: "email".tr,
                    data: _.mail,
                    onTrailingPressed: () => _.onEditPressed(),
                  ),
                  XDivider.semiFaded(),
                ],
              ),
            );
          }),
    );
  }
}
