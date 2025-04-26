part of 'imports_widget_create_new_application.dart';

class SheetSelectServiceName extends StatelessWidget {
  final Function(List<int>, String) onConfirmed;

  const SheetSelectServiceName({
    Key? key,
    required this.onConfirmed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FetchServicesController>(builder: (_) {
      return SheetHeader(
        title: "the_work_field",
        onSavePress: () {
          onConfirmed(_.jobServiceIdsSelected, _.selectedValue);
          Get.back();
        },
        sheetBody: Column(
          children: [
            if (0 == 1) ...[
              UnAvailableBuilder(
                child: AdaptiveSearchBar(
                  _.searchController!,
                  padding: AppInsets.defaultScreenALL,
                  height: 50.h,
                  hintLabel: "the_work_field".tr,
                  onSubmitted: _.searchLocal,
                  onChanged: _.searchLocal,
                ),
              ),
              YSpace.hard,
            ],
            Expanded(
              child: Padding(
                padding: AppInsets.defaultScreenALL,
                child: DataStatusBuilder(
                  status: _.dataState,
                  onDoneBuild: _.dataState is! DataSuccess
                      ? 0.ESH()
                      : ListView.builder(
                          physics: AppPhysics.alwaysScrollablePhysics,
                          itemCount: _.services.length,
                          itemBuilder: (context, index) {
                            final item = _.services[index];
                            return InkWell(
                              onTap: () {
                                _.setJobServiceIdsSelected(
                                  item.id,
                                  item.title,
                                );
                              },
                              child: MultiChoiceRowForm(
                                title: item.title,
                                isSelected: _.isContain(item.id),
                              ),
                            );
                          }),
                  onLoadingBuild: LoadingBox(
                    loading: Loading.twoRotatingArc(),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
