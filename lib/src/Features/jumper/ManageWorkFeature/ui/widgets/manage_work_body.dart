part of 'imports_widgets_manage_work.dart';

class ManageWorkBody extends StatelessWidget {
  const ManageWorkBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppInsets.defaultScreenALL,
      child: Column(
        children: [
          UnAvailableBuilder(child: ManageWorkReminderBuilder()),
          ManageWorkCurrentJobsBuilder(),
          UnAvailableBuilder(child: ManageWorkActivitiesBuilder()),
        ],
      ),
    );
  }
}
