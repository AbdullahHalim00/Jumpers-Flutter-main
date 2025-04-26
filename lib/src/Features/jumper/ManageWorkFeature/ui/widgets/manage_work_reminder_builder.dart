part of 'imports_widgets_manage_work.dart';

class ManageWorkReminderBuilder extends StatelessWidget {
  const ManageWorkReminderBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // upcoming reminder
        CustomText(
          "upcoming_reminders".tr,
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
            return UpcomingReminderCard(
              time: " 1ساعة : 5 دقيقة : 20 ثانية",
              jobTitle: "مبرمج باك اند",
              companyImage: "",
              companyName: "Taqadom",
              workStartTime: "9 ص",
              workEndTime: "5 م",
              onRequestDayOff: () => AppSheet.showBottomSheet(
                BuildRequestDayOffSheet(),
                title: "absence_permission".tr,
              ),
            );
          },
        ),
      ],
    );
  }
}
