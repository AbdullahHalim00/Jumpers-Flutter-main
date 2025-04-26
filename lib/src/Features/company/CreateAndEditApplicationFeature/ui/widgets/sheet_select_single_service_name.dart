part of 'imports_widget_create_new_application.dart';

class SheetSelectSingleServiceName extends StatelessWidget {
  final Function(int, String) onConfirmed;

  const SheetSelectSingleServiceName({
    Key? key,
    required this.onConfirmed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FetchServicesController>(builder: (_) {
      return SheetHeader(
        title: "the_work_field",
        onSavePress: () {
          onConfirmed(_.jobServiceIdSelected, _.selectedValue);
          Get.back();
        },
        sheetBody: Column(
          children: [
            // AdaptiveSearchBar(
            //   _.searchController!,
            //   padding: AppInsets.defaultScreenALL,
            //   height: 50.h,
            //   hintLabel: "the_work_field".tr,
            //   onSubmitted: _.searchLocal,
            // ),
            // YSpace.hard,
            Expanded(
              child: DataStatusBuilder(
                status: _.dataState,
                onDoneBuild: _.dataState is DataSuccess
                    ? (_.dataState is! DataSuccess)
                        ? 0.0.ESH()
                        : ListView.builder(
                            itemBuilder: (context, index) {
                              final item = _.services[index];
                              return InkWell(
                                onTap: () {
                                  _.setJobServiceIdSelected(
                                      _.services[index].id);
                                  _.setJobServiceSelected(index);

                                  _.setSelectedValue(_.services[index].title);
                                },
                                child: SingleChoiceRowForm(
                                  title: _.services[index].title,
                                  isSelected: _.jobServiceIdSelected ==
                                      _.services[index].id,
                                ),
                              );
                            },
                            itemCount: _.services.length,
                          )
                    : 0.ESW(),
                onLoadingBuild: LoadingBox(
                  loading: Loading.twoRotatingArc(),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
