part of 'imports_widget_create_new_application.dart';

class SheetSelectWorkTimeType extends StatelessWidget {
  final Function(int, String) onConfirmed;
  final int? selectedId;

  const SheetSelectWorkTimeType({
    Key? key,
    required this.onConfirmed,
    this.selectedId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FetchWorkTimeTypeController>(builder: (_) {
      return SheetHeader(
        title: "job_type",
        onSavePress: () {
          onConfirmed(_.selectedId, _.selectedValue);
          Get.back();
        },
        sheetBody: DataStatusBuilder(
          status: _.dataState,
          onDoneBuild: ListView.builder(
            itemBuilder: (context, index) {
              final item = _.dataState.data![index];
              return InkWell(
                onTap: () {
                  _.setSelectedId(item.id);
                  _.setSelectedValue(item.title);
                },
                child: SingleChoiceRowForm(
                  title: _.dataState.data![index].title,
                  isSelected: _.selectedId == _.dataState.data![index].id,
                ),
              );
            },
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
