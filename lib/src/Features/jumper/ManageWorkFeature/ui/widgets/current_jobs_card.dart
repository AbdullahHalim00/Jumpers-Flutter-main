part of 'imports_widgets_manage_work.dart';

class CurrentJobsCard extends StatelessWidget {
  // final String? time;
  final String? companyName;
  final String? companyImage;
  final String? jobTitle;
  final String? workStartTime;
  final String? workEndTime;
  final String? startedJobDate;
  final VoidCallback? onDetailsPressed;

  const CurrentJobsCard({
    Key? key,
    // this.time,
    this.companyName,
    this.companyImage,
    this.jobTitle,
    this.workStartTime,
    this.workEndTime,
    this.onDetailsPressed,
    this.startedJobDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      padding: AppInsets.defaultScreenALL,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    color: AppColors.primary,
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
              Container(
                height: 27.h,
                padding: EdgeInsets.all(5.0.w),
                decoration: BoxDecoration(
                  color: const Color(0xffF7F7F7),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: CustomText.subtitle(
                  "since".tr + "  " + "$startedJobDate",
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  fontSize: 9,
                  color: const Color(0xff6F7581),
                ),
              ),
            ],
          ),
          18.5.ESH(),
          CustomOutlinedButton(
            height: 40.h,
            primaryColor: AppColors.secondary,
            isCurvedBorders: true,
            child: CustomText(
              'job_details'.tr,
              fontSize: 12,
              fontWeight: FW.regular,
            ),
            onPressed: onDetailsPressed,
          ),
        ],
      ),
    );
  }
}
