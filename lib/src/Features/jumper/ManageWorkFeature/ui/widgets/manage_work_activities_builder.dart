part of 'imports_widgets_manage_work.dart';

class ManageWorkActivitiesBuilder extends StatelessWidget {
  const ManageWorkActivitiesBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // upcoming reminder
        CustomText(
          "latest_activities".tr,
          fontSize: 14,
          fontWeight: FW.medium,
          padding: EdgeInsets.only(
            top: 32.h,
            bottom: 19.h,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: AppPhysics.neverScrollable,
          itemCount: 1,
          itemBuilder: (context, index) {
            return Container();
          },
        ),
      ],
    );
  }
}
