import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Features/company/jobs/bloc/controller/company_activity_emplyee_controller.dart';
import 'package:jumper/src/Features/jumper/JobDetailsFeature/widgets/info_widget.dart';

import '../../../../../Bloc/models/company_job_model.dart';
import '../../../../../Ui/list_tiles/dotted_info_tile.dart';

class CompanyJobInfoScreen extends StatelessWidget {
  final CompanyJobModel? job;

  const CompanyJobInfoScreen({Key? key, this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<CompanyActivityEmployeeController>(builder: (controller) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: InfoWidget(
                      title: "attendance_days".tr,
                      icon: const Icon(
                        Icons.edit_calendar,
                        size: 25,
                      ),
                      data: controller
                          .employeeActivityResponse!.data!.attendanceDays
                          .toString(),
                    )),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: InfoWidget(
                      title: 'not_absence_days'.tr,
                      icon: const Icon(
                        Icons.calendar_month,
                        size: 25,
                      ),
                      data: controller.employeeActivityResponse!.data!.depDays
                          .toString(),
                    )),
                  ],
                ),
                // SizedBox(
                //   height: 16,
                // ),
                // Row(
                //   children: [
                //     Expanded(
                //         child: InfoWidget(
                //       title: 'absence'.tr,
                //       icon: Icon(
                //         Icons.logout,
                //         size: 25,
                //       ),
                //       data: controller.jobDetailsResponse!.data!.cancel
                //           .toString(),
                //     )),
                //     SizedBox(
                //       width: 16,
                //     ),
                //     Expanded(
                //         child: InfoWidget(
                //       title: 'additional_time'.tr,
                //       icon: Icon(
                //         Icons.access_time_sharp,
                //         size: 25,
                //       ),
                //       // data: controller.jobDetailsResponse!.data!.,
                //     )),
                //   ],
                // ),
                const SizedBox(
                  height: 30,
                ),
                DottedInfoTile(
                  label: "job_title".tr,
                  data: job!.serviceTitle,
                ),
                Row(
                  children: [
                    Expanded(
                      child: DottedInfoTile(
                        label: "",
                        data: job!.workTypeTitle,
                      ),
                    ),
                    Expanded(
                      child: DottedInfoTile(
                        label: "from_company".tr,
                        data: '',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: DottedInfoTile(
                        label: "work".tr,
                        data: '${job!.startTime24} - ${job!.endTime24}',
                      ),
                    ),
                    Expanded(
                      child: DottedInfoTile(
                        label: "salary".tr,
                        data: '${job!.salary} ريال سعودي ',
                      ),
                    ),
                  ],
                ),

                DottedInfoTile(
                  label: "start_date".tr,
                  data: job!.startDate,
                ),
                DottedInfoTile(
                  label: "end_date".tr,
                  data: job!.endDate,
                ),
                Row(
                  children: [
                    Expanded(
                      child: DottedInfoTile(
                        label: "total_work_days".tr,
                        data: '${job!.days.length}',
                      ),
                    ),
                    Expanded(
                      child: DottedInfoTile(
                        label: "total_salary".tr,
                        data: '${job!.salary}',
                      ),
                    ),
                  ],
                ),
                DottedInfoTile(
                  label: "address".tr,
                  data: job!.fullAddress,
                ),
                // DottedInfoTile(
                //   label: "قابلية التجديد".tr,
                //   data: '${controller.jobDetailsResponse!.data!}',
                // ),
                const SizedBox(
                  height: 100,
                ),

                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
