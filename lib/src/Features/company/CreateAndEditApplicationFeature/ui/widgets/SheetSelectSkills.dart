part of 'imports_widget_create_new_application.dart';

class SheetSelectSkills extends StatelessWidget {
  final Function(List<int>, String) onConfirmed;

  const SheetSelectSkills({
    Key? key,
    required this.onConfirmed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FetchSkillsController>(
        init: FetchSkillsController(),
        builder: (_) {
          return SheetHeader(
            title: "skills".tr,
            onSavePress: () {
              onConfirmed(_.skillIds, _.skillValues);
              Get.back();
            },
            sheetBody: DataStatusBuilder(
              status: _.dataState,
              onDoneBuild: (_.dataState is! DataSuccess)
                  ? 0.0.ESH()
                  : ListView.builder(
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          _.setSelectedSkill(_.dataState.data![index].id,
                              _.dataState.data![index].title);
                        },
                        child: MultiChoiceRowForm(
                          title: _.dataState.data![index].title,
                          isSelected: _.isContain(_.dataState.data![index].id),
                        ),
                      ),
                      itemCount: _.dataState.data!.length,
                    ),
              onLoadingBuild: LoadingBox(
                loading: Loading.twoRotatingArc(),
              ),
            ),
          );
        });
  }
}

// part of 'imports_widget_create_new_application.dart';
//
// class BuildSelectSkillsSheet extends StatelessWidget {
//   final Function(String? )? onConfirmed;
//
//   const BuildSelectSkillsSheet({Key? key, this.onConfirmed}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<FetchSkillsController>(
//          builder: (_) {
//           return NewRequestStatusBuilder(
//             status:_.dataState,
//             onDoneBuild: CheckBoxListViewBuilder(
//               list: _.skills.map((e) => e.title).toList(),
//               onConfirmed: onConfirmed,
//             ),
//             onLoadingBuild: LoadingBox(loading: Loading.twoRotatingArc(),),
//           );
//         });
//   }
// }
//
//
//
//
