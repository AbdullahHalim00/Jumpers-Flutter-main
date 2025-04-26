part of 'imports_widgets_manage_work.dart';

enum ReminderStatus {
  forAttendance,
  attend,
  forLeaving,
}

class UpcomingReminderCard extends StatelessWidget {
  final String? time;
  final String? companyName;
  final String? companyImage;
  final String? jobTitle;
  final String? workStartTime;
  final String? workEndTime;
  final VoidCallback? onRequestDayOff;

  const UpcomingReminderCard({
    Key? key,
    this.time,
    this.companyName,
    this.companyImage,
    this.jobTitle,
    this.workStartTime,
    this.workEndTime,
    this.onRequestDayOff,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      padding: AppInsets.defaultScreenALL,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: Image.network(
                  companyImage != ""
                      ? "$companyImage"
                      : Assets.networkKDefaultUser,
                  fit: BoxFit.cover,
                  height: 38.h,
                  width: 38.h,
                ),
              ),
              17.0.ESW(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    "$companyName",
                    fontSize: 14,
                    fontWeight: FW.semiBold,
                  ),
                  9.0.ESH(),
                  CustomText(
                    "$jobTitle",
                    fontSize: 11,
                    fontWeight: FW.regular,
                  ),
                  9.0.ESH(),
                  CustomText.subtitle(
                    "work".tr +
                        " : " +
                        "$workStartTime" +
                        " - " +
                        "$workEndTime",
                    fontSize: 11,
                    fontWeight: FW.light,
                  ),
                ],
              ),
              const Spacer(),
              // absence card
              InkWell(
                onTap: onRequestDayOff,
                child: Container(
                  height: 27.h,
                  padding: EdgeInsets.all(5.0.w),
                  decoration: BoxDecoration(
                    color: const Color(0xffFAF6F3),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: CustomText.subtitle(
                    "submit_absence_permission".tr,
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    fontSize: 9,
                    color: const Color(0xffBF8C6D),
                  ),
                ),
              ),
            ],
          ),
          18.5.ESH(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 42.w, vertical: 12.h),
            decoration: BoxDecoration(
                color: AppColors.containerBCGGrey,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  width: 1,
                  color: AppColors.containerBorder,
                )),
            child: Row(
              children: [
                Image.asset(
                  Assets.clock,
                  height: 20.h,
                  width: 20.h,
                ),
                XSpace.light,
                Expanded(
                  child: CustomText.subtitle(
                    "remaining_to_attend".tr + " : " + "$time",
                    fontWeight: FW.regular,
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
