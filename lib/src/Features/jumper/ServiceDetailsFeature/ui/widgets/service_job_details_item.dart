part of 'imports_widgets_service_details.dart';

class ServiceJobDetailsItem extends StatelessWidget {
  final JumperJob service;

  const ServiceJobDetailsItem({
    Key? key,
    required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('service......${service.toString()}');
    return Container(
      padding: AppInsets.defaultScreenALL,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // job description + publish date + hours
          GeneralDetailsCard(
            isSectionDivider: false,
            label: "job_description".tr,
            body: Column(
              children: [
                CustomText.subtitle(
                  (service.description != "" ? service.description : "-"),
                  fontWeight: FW.light,
                ),
                14.0.ESH(),
                Row(
                  children: [
                    if (service.publishedAt != "") ...[
                      SimpleIconLabelTile(
                        label: service.publishedAt,
                        imageUrl: Assets.clock,
                      ),
                      const Spacer(),
                    ],
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
            label: "job_data".tr,
            body: Column(
              children: [
                // work field + jobTitle
                DottedInfoTile(
                  label: "work_field".tr,
                  data:
                      (service.serviceTitle != "" ? service.serviceTitle : "-"),
                ),
                // Row(
                //   children: [
                //     Expanded(
                //       child: DottedInfoTile(
                //         label: "work_field".tr,
                //         data: (service.serviceTitle!=""?service.serviceTitle:"-"),
                //       ),
                //     ),
                //     // Expanded(
                //     //   child: SizedBox(
                //     //     height: 20.h,
                //     //     child: DottedInfoTile(
                //     //       label: "job_title".tr,
                //     //       data: (service.serviceTitle!=""?service.serviceTitle:"-"),
                //     //     ),
                //     //   ),
                //     // ),
                //   ],
                // ),
                // work type +  work place

                Row(
                  children: [
                    Expanded(
                      child: DottedInfoTile(
                        label: "work_type".tr,
                        data: (service.timeTypeTitle != ""
                            ? service.timeTypeTitle
                            : "-"),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          String googleUrl =
                              'https://www.google.com/maps/search/?api=1&query=${service.companyLat.toDouble()},${service.companyLon.toDouble()}';
                          if (await canLaunch(googleUrl)) {
                            await launch(googleUrl);
                          } else {
                            throw 'Could not open the map.';
                          }
                          // openMapsApp() async {

                          // }
                          // Get.to(LocationScreen(
                          //   latitude: ,
                          //   longitude: ,
                          // ));
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 6.r,
                              height: 6.r,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            CustomText(
                              "${"distance".tr}",
                              fontWeight: FW.regular,
                              fontSize: 12.sp,
                              isOverFlow: true,
                            ),
                            Text(
                              service.distance.toString() != ""/////////
                                  ? service.distance.toString() + " KM"
                                  : "-",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12.sp,
                                color: Colors.blueAccent,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                //work + salary
                Row(
                  children: [
                    if (service.startTimeFormat != "" &&
                        service.endTimeFormat != "")
                      Expanded(
                        child: DottedInfoTile(
                          label: "work".tr,
                          data: service.startTimeFormat +
                              " - " +
                              service.endTimeFormat,
                        ),
                      ),
                  ],
                ),
                //startDate + EndDate
                if (service.salary != 0)
                  DottedInfoTile(
                    label: "salary".tr,
                    data: "${service.salary}" + " " + "currency_per_day".tr,
                  ),
                if (service.startDate != "")
                  DottedInfoTile(
                    label: "start_date".tr,
                    data: service.startDate,
                  ),

                if (service.endDate != "")
                  DottedInfoTile(
                    label: "end_date".tr,
                    data: service.endDate,
                  ),

                //    total salary
                DottedInfoTile(
                  label: "work_days".tr,
                  data: (service.numberOfDays != 0
                          ? service.numberOfDays.toString()
                          : "-") +
                      "day".tr,
                ),
                //detailed address
                DottedInfoTile(
                  label: "city".tr,
                  data: (service.city != "" ? service.city : "-"),
                ),
              ],
            ),
          ),
          // skills
          GeneralDetailsCard(
            label: "skills".tr,
            body: (service.skills.isNotEmpty)
                ? Wrap(
                    children: service.skills
                        .map(
                          (e) => CustomChip(label: e.title),
                        )
                        .toList(),
                  )
                : Center(child: CustomText.subtitle("empty_required_skills")),
          ),
        ],
      ),
    );
  }
}
