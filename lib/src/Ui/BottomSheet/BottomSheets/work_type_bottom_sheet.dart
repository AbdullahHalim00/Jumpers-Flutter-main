import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/decorations/app_physics.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/controller/fetch_work_type_controller.dart';
import 'package:jumper/src/Ui/BottomSheet/widgets/single_choice_row_form.dart';
import 'package:jumper/src/Ui/empty/empty_imports.dart';
import 'package:jumper/src/Ui/sheets/app_Sheet.dart';

class WorkTypeBottomSheet extends StatelessWidget {
  final Function(int, String) onSave;

  const WorkTypeBottomSheet({
    required this.onSave,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FetchWorkTypeController>(
      builder: (_) {
        var item = _.dataState!.data;
        return SheetHeader(
          title: "work_type".tr,
          onSavePress: () {
            onSave(_.workTypeId, _.workTypeTitle);
            Get.back();
          },
          sheetBody: item!.isEmpty
              ? const EmptyButtonSheetScreen()
              : ListView.builder(
                  physics: AppPhysics.alwaysScrollablePhysics,
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    final work = item[index];
                    return InkWell(
                      onTap: () {
                        if (_.workTypeId != work.id) {
                          _.setWorkTypeId(work.id);
                          _.setWorkTypeTitle(work.title);
                        } else {
                          _.setWorkTypeId(0);
                          _.setWorkTypeTitle('');
                        }
                      },
                      child: SingleChoiceRowForm(
                        title: work.title,
                        isSelected: _.workTypeId == work.id,
                      ),
                    );
                  }),
        );
      },
    );
  }
}
