import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/decorations/app_physics.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/controller/fetch_add_jop_info_controller.dart';
import 'package:jumper/src/Ui/BottomSheet/widgets/single_choice_row_form.dart';
import 'package:jumper/src/Ui/sheets/app_Sheet.dart';

import '../../loading/loading_box.dart';

class AccountTypeBottomSheet extends StatelessWidget {
  final Function(int, String, int) onSave;

  const AccountTypeBottomSheet({
    required this.onSave,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FetchAddJobInfoController>(
      builder: (_) {
        var item;
        if (_.dataState!.data != null) {
          item = _.dataState!.data!;
        }

        return _.dataState!.data == null
            ? LoadingBox()
            : SheetHeader(
                title: "account_type".tr,
                onSavePress: () {
                  onSave(_.accountTypeId, _.accountTypeTitle, 20);
                  Get.back();
                },
                sheetBody: _.dataState is DataSuccess
                    ? ListView.builder(
                        physics: AppPhysics.alwaysScrollablePhysics,
                        itemCount: item.accountTypes.length,
                        itemBuilder: (context, index) {
                          final work = item.accountTypes[index];
                          return InkWell(
                            onTap: () {
                              if (_.accountTypeId != work.id) {
                                _.setAccountTypeId(work.id);
                                _.setAccountTypeCost(work.price);
                                _.setAccountTypeTitle(work.title);
                              } else {
                                _.setAccountTypeId(0);
                                _.setAccountTypeCost(0);
                                _.setAccountTypeTitle('');
                              }
                            },
                            child: SingleChoiceRowForm(
                              title: work.title,
                              isSelected: _.accountTypeId == work.id,
                            ),
                          );
                        })
                    : 0.ESH(),
              );
      },
    );
  }
}
