part of 'imports_widgets_employee_details.dart';

class SheetSelectCauseName extends StatelessWidget {
  final Function(int, String) onConfirmed;
  final int? selectedId;

  const SheetSelectCauseName({
    Key? key,
    required this.onConfirmed,
    this.selectedId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FetchRefusingReasonsController>(builder: (_) {
      return SheetHeader(
        title: "the_work_field",
        onSavePress: () {
          onConfirmed(_.selectedId, _.selectedValue);
          Get.back();
        },
        sheetBody: DataStatusBuilder(
          status: _.dataState,
          onDoneBuild: _.dataState is! DataSuccess
              ? 0.0.ESH()
              : ListView.builder(
                  itemBuilder: (context, index) {
                    final item = _.dataState.data![index];
                    return InkWell(
                      onTap: () {
                        _.setRefuseIdSelected(item.id);
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
