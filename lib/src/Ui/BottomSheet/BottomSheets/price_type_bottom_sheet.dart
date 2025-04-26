import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/decorations/app_physics.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/controller/fetch_add_jop_info_controller.dart';
import 'package:jumper/src/Ui/BottomSheet/widgets/single_choice_row_form.dart';
import 'package:jumper/src/Ui/sheets/app_Sheet.dart';

class PriceTypeBottomSheet extends StatelessWidget {
  final Function(int, String) onSave;

  const PriceTypeBottomSheet({
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
            onSave(_.priceTypeId, _.priceTypeTitle);
            Get.back();
          },
          sheetBody: _.dataState is DataSuccess
              ? ListView.builder(
                  physics: AppPhysics.alwaysScrollablePhysics,
                  itemCount: item.priceTypes.length,
                  itemBuilder: (context, index) {
                    final priceType = item.priceTypes[index];
                    return InkWell(
                      onTap: () {
                        if (_.priceTypeId != priceType.id) {
                          _.setPriceTypeId(priceType.id);
                          _.setPriceTypeTitle(priceType.title);
                        } else {
                          _.setPriceTypeId(0);
                          _.setPriceTypeTitle('');
                        }
                      },
                      child: SingleChoiceRowForm(
                        title: priceType.title,
                        isSelected: _.priceTypeId == priceType.id,
                      ),
                    );
                  })
              : 0.ESH(),
        );
      },
    );
  }
}
