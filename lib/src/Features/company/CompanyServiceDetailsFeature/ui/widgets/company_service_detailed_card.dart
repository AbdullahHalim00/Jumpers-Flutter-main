part of 'imports_widget_company_service_details.dart';

class CompanyServiceDetailsCard extends StatelessWidget {
  final CompanyJobModel service;

  const CompanyServiceDetailsCard({
    Key? key,
    required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedWrapper(
      index: 3,
      child: CustomListView(
        children: [
          // job description + publish date + hours
          GeneralDetailsCard(
            onTopDivider: false,
            label: "job_description".tr,
            body: Column(
              children: [
                CustomText.subtitle(
                  service.description,
                  fontWeight: FW.light,
                ),
                14.0.ESH(),
                Row(
                  children: [
                    SimpleIconLabelTile(
                      label: service.publishedAt,
                      imageUrl: Assets.clock,
                    ),
                    const Spacer(),
                    if (service.hoursToAccept != 0)
                      SimpleIconLabelTile(
                        label:
                            "${service.hoursToAccept}" + ("hour_to_accept".tr),
                        imageUrl: Assets.clock,

                        /// change to timer_icon
                      ),
                  ],
                ),
                14.0.ESH(),
              ],
            ),
          ),
          // personal Info
          GeneralDetailsCard(
            onTopDivider: false,
            label: "job_data".tr,
            body: Column(
              children: [
                // work field + jobTitle
                Row(
                  children: [
                    Expanded(
                      child: DottedInfoTile(
                        label: "work_field".tr,
                        // data: "${service.workField}"
                        data: service.serviceTitle.tr,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 20.h,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: DottedInfoTile(
                            label: "job_title".tr,
                            data: service.workTypeTitle.tr,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // work type +  work place

                Row(
                  children: [
                    if (service.workTypeTitle != "")
                      Expanded(
                        child: DottedInfoTile(
                          label: "work_type".tr,
                          data: service.workTypeTitle,
                        ),
                      ),
                    Expanded(
                      child: DottedInfoTile(
                        label: "work".tr,
                        data: service.startTimeFormat +
                            " - " +
                            service.endTimeFormat,
                      ),
                    ),
                    // if(service.work_place!="")
                    //   Expanded(
                    //   child: DottedInfoTile(
                    //     label: "work_place".tr,
                    //     data:  "  من النادي",
                    //   ),
                    // ),
                  ],
                ),
                //work + salary
                // Row(
                //   children: [
                //     Expanded(
                //       child: DottedInfoTile(
                //         label: "work".tr,
                //         data: service.startTimeFormat + " - " + service.endTimeFormat,
                //       ),
                //     ),
                //     if (service.salary != 0)
                //       Expanded(
                //         child: FittedBox(
                //           fit: BoxFit.fitWidth,
                //           child: DottedInfoTile(
                //             label: "salary".tr,
                //             data: "${service.salary}" " " + "currency_per_day".tr,
                //           ),
                //         ),
                //       ),
                //   ],
                // ),
                //startDate + EndDate
                DottedInfoTile(
                  label: "start_date".tr,
                  data: service.startDate,
                ),
                DottedInfoTile(
                  label: "end_date".tr,
                  data: service.endDate,
                ),
                //workdays + total salary
                Row(
                  children: [
                    Expanded(
                      child: DottedInfoTile(
                        label: "work_days".tr,
                        data: "${service.totalWorkDays}" + "day".tr,
                      ),
                    ),
                  ],
                ),
                if (service.salary != 0)
                  DottedInfoTile(
                    label: "total_salary".tr,
                    data: "${service.salary}" + " " + "currency_per_day".tr,
                  ),
                //detailed address
                DottedInfoTile(
                  label: "address".tr,
                  data: service.companyAddress,
                ),
                // required skills
                GeneralDetailsCard(
                  label: "skills".tr,
                  body: Wrap(
                    children: service.skills
                        .map(
                          (e) => CustomChip(label: "${e.title}"),
                        )
                        .toList(),
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
