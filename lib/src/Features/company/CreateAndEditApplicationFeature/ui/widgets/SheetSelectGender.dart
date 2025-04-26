// part of 'imports_widget_create_new_application.dart';
//
// class SheetSelectGender extends StatelessWidget {
//   const SheetSelectGender({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: AppInsets.defaultScreenALL,
//       child: StatefulBuilder(
//         builder: (context,setState) {
//           return ListView.builder(
//               physics: AppPhysics.alwaysScrollablePhysics,
//                itemCount: GenderData.genderList.length,
//               itemBuilder: (context, index) {
//                 final gender = GenderData.genderList[index];
//                  return GetBuilder<AddJobController>(
//                     builder: (_) {
//                     return CustomRadioTile(
//                       suffixWidget: CircleAvatar(
//                         backgroundImage:
//                             AssetImage(gender.img ?? Assets.info),
//                         radius: 12.r,
//                         backgroundColor: AppColors.transparent,
//                       ),
//                       label: "${gender.label}",
//                       isSelected: gender.isSelected,
//                       onTap: () {
//                         for (var element in GenderData.genderList) {
//                           element.isSelected = false;
//                           print("${element.isSelected}");
//                         }
//                         setState(() {
//                           gender.isSelected = true;
//                           print("my item ${gender.isSelected}");
//
//                         });
//                         _.setGender("${gender.label}");
//                         // Get.back();
//                       },
//                     );
//                   // });
//                 });
//               });
//         }
//       ),
//     );
//   }
// }
part of 'imports_widget_create_new_application.dart';

class SheetSelectGender extends StatelessWidget {
  final int? id;
  final Function(int, String)? onSaved;

  const SheetSelectGender({
    Key? key,
    this.onSaved,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GenderController>(
        init: GenderController(id: id),
        builder: (_) {
          return SheetHeader(
            title: "gender",
            onSavePress: () {
              onSaved!(_.selectedId, _.selectedValue);
              Get.back();
            },
            sheetBody: Padding(
              padding: AppInsets.defaultScreenALL,
              child: ListView.builder(
                physics: AppPhysics.alwaysScrollablePhysics,
                itemCount: _.genders.length,
                itemBuilder: (context, index) {
                  final item = _.genders[index];
                  return InkWell(
                    onTap: () {
                      _.setSelectedIds(item.id!);
                      _.setSelectedValue(item.label!);
                    },
                    child: CustomRadioTile(
                      suffixWidget: CircleAvatar(
                        backgroundImage: AssetImage(item.img ?? Assets.flag),
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
          );
        });
  }
}
//       child: DataStatusBuilder(
//         status: _.dataState,
//         onDoneBuild: _.dataState is DataSuccess?  ListView.builder(
//           itemBuilder: (context, index) {
//             final item = _.dataState.data![index];
//             return InkWell(
//               onTap: () {
//                 _.setJobServiceIdsSelected(_.dataState.data![index].id,
//                     _.dataState.data![index].title);
//               },
//               child: MultiChoiceRowForm(
//                 title: _.dataState.data![index].title,
//                 isSelected: _.isContain(_.dataState.data![index].id),
//               ),
//             );
//           },
//           itemCount: _.dataState.data!.length,
//         ):0.ESW(),
//         onLoadingBuild: LoadingBox(
//           loading: Loading.twoRotatingArc(),
//         ),
//       ),
//     ),
