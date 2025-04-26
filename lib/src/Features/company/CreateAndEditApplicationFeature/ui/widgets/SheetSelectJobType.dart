part of 'imports_widget_create_new_application.dart';

class SheetSelectJobType extends StatelessWidget {
  const SheetSelectJobType({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FetchWorkTimeTypesController>(builder: (_) {
      return Padding(
        padding: AppInsets.defaultScreenALL,
        child: ListView.builder(
            physics: AppPhysics.alwaysScrollablePhysics,
            itemCount: _.dataState!.data!.length,
            itemBuilder: (context, index) {
              final work = _.dataState!.data![index];
              return InkWell(
                onTap: () {
                  if (_.idSelected != work.id) {
                    _.setId(work.id);
                  } else {
                    _.setId(0);
                  }
                },
                child: SingleChoiceRowForm(
                  title: work.title,
                  isSelected: _.idSelected == work.id,
                ),
              );
            }),
      );
    });
  }
}
