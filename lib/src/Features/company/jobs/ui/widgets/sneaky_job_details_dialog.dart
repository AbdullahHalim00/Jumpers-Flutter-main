part of 'imports_widgets_job_screen.dart';

class SneakyJobDetailsDialog extends StatelessWidget {
  final CompanyJobModel job;

  // final CompanyJobModel job;

  const SneakyJobDetailsDialog({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // margin: EdgeInsets.symmetric(vertical: 10.h),
          child: AlertDialog(
            shape: AppShapes.dialogShape,
            content: Transform.scale(
              scale: .9,
              child: AnimatedWrapper(
                styles: WrapAnimationStyles.fade,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// added
                    JobDetailsCard(
                      status: job.status,
                      hidStatus: true,
                      jobTitle: job.serviceTitle,
                      salary: job.salary.toString(),
                      address: job.companyAddress,
                      workType: job.workTypeTitle,
                      workStartTime: job.startTimeFormat,
                      workEndTime: job.endTimeFormat,
                      workStartDate: job.startDate,
                      workEndDate: job.endDate,
                      fullAddress: job.fullAddress,
                    ),
                    Row(
                      children: [
                        CustomText(
                          "published_at".tr + " : ",
                          fontWeight: FW.regular,
                          fontSize: 11,
                        ),
                        CustomText.subtitle(
                          job.publishedAt.adN,
                          fontWeight: FW.regular,
                          fontSize: 11,
                        ),
                      ],
                    ),
                    13.0.ESH(),
                    if (job.salary != 0)
                      DottedInfoTile(
                        label: "total_salary".tr,
                        data: "${job.salary}" + " " + "currency_per_day".tr,
                      ),
                    13.0.ESH(),
                    GeneralDetailsCard(
                      label: "skills".tr,
                      isSectionDivider: false,
                      body: Wrap(
                        children: job.skills
                            .map(
                              (e) => CustomChip(label: "$e"),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        //applicants
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 100.h),
            child: ConditionalBuilder(
              condition: job.applicants.isNotEmpty,
              onBuild: CarouselSliderBuilder<ApplicantsModel>(
                list: job.applicants,
                builder: (context, item) {
                  return Column(
                    children: [
                      //image
                      ConditionalBuilder(
                        condition: item.image != "",
                        onBuild: CircleAvatar(
                          radius: 30.r,
                          backgroundImage: NetworkImage(item.image),
                        ),
                        onFeedBack: CircleAvatar(
                          radius: 30.r,
                          backgroundImage: const AssetImage(Assets.defaultUser),
                        ),
                      ),
                      CustomText.subtitle(
                        item.name,
                        fontWeight: FW.semiBold,
                        color: AppColors.primary,
                      ),
                    ],
                  );
                },
              ),
              onFeedBack: Row(
                children: [
                  CustomText(
                    "applicants".tr + " : ",
                    fontWeight: FW.regular,
                    fontSize: 11,
                  ),
                  CustomText.subtitle(
                    "no_applicants".tr,
                    fontWeight: FW.regular,
                    fontSize: 11,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
