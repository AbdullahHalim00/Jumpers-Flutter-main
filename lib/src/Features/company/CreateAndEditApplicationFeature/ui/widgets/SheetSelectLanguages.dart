part of 'imports_widget_create_new_application.dart';

class SheetSelectLanguages extends StatelessWidget {
  final Function(List<int>?, String?) onConfirmed;

  const SheetSelectLanguages({Key? key, required this.onConfirmed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FetchLanguagesController>(builder: (_) {
      return SheetHeader(
        title: "language".tr,
        onSavePress: () {
          onConfirmed(_.languageIds, _.languageValues);
          Get.back();
          printDM("lang ids => ${_.languageIds}");
          printDM("lang values => ${_.languageValues}");
        },
        sheetBody: DataStatusBuilder(
          status: _.dataState,
          onDoneBuild: ListView.builder(
            itemBuilder: (context, index) {
              final item = _.dataState.data![index];
              return InkWell(
                onTap: () {
                  _.setSelectedLang(_.dataState.data![index].id,
                      _.dataState.data![index].title);
                },
                child: MultiChoiceRowForm(
                  title: _.dataState.data![index].title,
                  isSelected: _.isContain(_.dataState.data![index].id),
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
