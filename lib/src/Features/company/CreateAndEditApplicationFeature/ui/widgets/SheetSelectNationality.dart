part of 'imports_widget_create_new_application.dart';

class SheetSelectNationality extends StatelessWidget {
  final int? id;
  final Function(int, String)? onSaved;

  const SheetSelectNationality({
    Key? key,
    this.onSaved,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NationalityController>(
        init: NationalityController(id: id ?? null),
        builder: (_) {
          return SheetHeader(
            title: "nationality",
            onSavePress: () {
              onSaved!(_.selectedId, _.selectedValue);
              Get.back();
            },
            sheetBody: Padding(
              padding: AppInsets.defaultScreenALL,
              child: ListView.builder(
                physics: AppPhysics.alwaysScrollablePhysics,
                itemCount: _.nationalities.length,
                itemBuilder: (context, index) {
                  final item = _.nationalities[index];
                  return InkWell(
                    onTap: () {
                      _.setSelectedIds(item.id!);
                      _.setSelectedValue(item.label!);
                    },
                    child: CustomRadioTile(
                      suffixWidget: CircleAvatar(
                        backgroundImage:
                            AssetImage(item.flagImg ?? Assets.flag),
                        radius: 12.r,
                        backgroundColor: AppColors.transparent,
                      ),
                      label: "${item.label}",
                      isSelected: _.selectedId == item.id,
                      onTap: () {
                        _.setSelectedValue("${item.label}");
                        _.setSelectedIds(item.id!);
                        // Get.back();
                      },
                    ),
                    // child: SingleChoiceRowForm(
                    //   title: _.dataState.data![index].title,
                    //   isSelected: _.selectedId ==
                    //       _.dataState.data![index].id,
                    // ),
                  );
                },
              ),
            ),
            // sheetBody: Padding(
            //   padding: AppInsets.defaultScreenALL,
            //   child: StatefulBuilder(builder: (context, setState) {
            //     return ListView.builder(
            //         physics: AppPhysics.alwaysScrollablePhysics,
            //         itemCount: NationalityData.nationalities.length,
            //         itemBuilder: (context, index) {
            //           final nat = NationalityData.nationalities[index];
            //           return GetBuilder<AddJobController>(builder: (_) {
            //             return CustomRadioTile(
            //               suffixWidget: CircleAvatar(
            //                 backgroundImage: AssetImage(nat.flagImg ?? Assets.flag),
            //                 radius: 12.r,
            //                 backgroundColor: AppColors.transparent,
            //               ),
            //               label: "${nat.label}",
            //               isSelected: nat.isSelected,
            //               onTap: () {
            //                 for (var element in NationalityData.nationalities) {
            //                   element.isSelected = false;
            //                 }
            //                 setState(() {
            //                   nat.isSelected = true;
            //                 });
            //
            //                 _.setNationality("${nat.label}");
            //                 // Get.back();
            //               },
            //             );
            //           });
            //         });
            //   }),
            // ),
          );
        });
  }
}
