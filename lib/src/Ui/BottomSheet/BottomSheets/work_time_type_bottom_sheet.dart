import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/decorations/app_physics.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/controller/fetch_add_jop_info_controller.dart';
import 'package:jumper/src/Ui/BottomSheet/widgets/single_choice_row_form.dart';
import 'package:jumper/src/Ui/sheets/app_Sheet.dart';
import 'package:jumper/src/core/utils/extensions.dart';

class WorkTimeTypeBottomSheet extends StatelessWidget {
  final Function(int, String) onSave;

  const WorkTimeTypeBottomSheet({
    required this.onSave,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FetchAddJobInfoController>(
      builder: (_) {
        var item = _.dataState!.data!;
        return SheetHeader(
          title: "work_type".tr,
          onSavePress: () {
            onSave(_.timeTypeId, _.timeTypeTitle);
            Get.back();
          },
          sheetBody: _.dataState is DataSuccess
              ? ListView.builder(
                  physics: AppPhysics.alwaysScrollablePhysics,
                  itemCount: item.timeTypes.length,
                  itemBuilder: (context, index) {
                    final work = item.timeTypes[index];
                    return InkWell(
                      onTap: () {
                        if (_.timeTypeId != work.id) {
                          _.setTimeTypeId(work.id);
                          _.setTimeTypeTitle(work.title);
                        } else {
                          _.setTimeTypeId(0);
                          _.setTimeTypeTitle('');
                        }
                      },
                      child: SingleChoiceRowForm(
                        title: work.title,
                        isSelected: _.timeTypeId == work.id,
                      ),
                    );
                  })
              : 0.ESH(),
        );
      },
    );
  }
}
