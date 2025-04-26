import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Features/jumper/JobDetailsFeature/widgets/info_widget.dart';
import 'package:jumper/src/Features/jumper/JumperHomeFeature/bloc/controller/jumper_jobs_controller.dart';

import '../../../../Ui/list_tiles/dotted_info_tile.dart';

class JobInfoScreen extends StatelessWidget {
  const JobInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<JumperJobsController>(builder: (controller) {
      return Scaffold(
        persistentFooterButtons: [
          Visibility(
            visible: controller.jobDetailsResponse!.data!.status == 4,
            child: InkWell(
              onTap: () {
                log(controller.jobDetailsResponse!.data!.status.toString());
                if (controller.jobDetailsResponse!.data!.isOnline == 0) {
                  controller.getUserLocation(
                      controller.jobDetailsResponse!.data!.id.toString(), 1);
                } else {
                  controller.getUserLocation(
                      controller.jobDetailsResponse!.data!.id.toString(), 0);
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.basicColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: controller.isLoading
                    ? const CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      )
                    : Text(
                        controller.jobDetailsResponse!.data!.isOnline == 1
                            ? 'absence_record'.tr
                            : 'attendance_record'.tr,
                        style:
                            const TextStyle(fontSize: 17, color: Colors.white),
                      ),
              ),
            ),
          ),
        ],
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
                      data: controller.jobDetailsResponse!.data!.countAttendees
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
                      data: controller.jobDetailsResponse!.data!.countDeparture
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
                  data: "${controller.jobDetailsResponse!.data!.serviceTitle}",
                ),
                Row(
                  children: [
                    Expanded(
                      child: DottedInfoTile(
                        label: "",
                        data:
                            '${controller.jobDetailsResponse!.data!.workTypeTitle}',
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
                        data:
                            '${controller.jobDetailsResponse!.data!.startTime} - ${controller.jobDetailsResponse!.data!.endTime}',
                      ),
                    ),
                    Expanded(
                      child: DottedInfoTile(
                        label: "salary".tr,
                        data:
                            '${controller.jobDetailsResponse!.data!.price} ريال سعودي ',
                      ),
                    ),
                  ],
                ),
                DottedInfoTile(
                  label: "start_date".tr,
                  data: '${controller.jobDetailsResponse!.data!.startDate}',
                ),
                DottedInfoTile(
                  label: "end_date".tr,
                  data: '${controller.jobDetailsResponse!.data!.endDate}',
                ),

                Row(
                  children: [
                    Expanded(
                      child: DottedInfoTile(
                        label: "total_work_days".tr,
                        data:
                            '${controller.jobDetailsResponse!.data!.numberOfDays}',
                      ),
                    ),
                    Expanded(
                      child: DottedInfoTile(
                        label: "total_salary".tr,
                        data: '${controller.jobDetailsResponse!.data!.price}',
                      ),
                    ),
                  ],
                ),
                DottedInfoTile(
                  label: "address".tr,
                  data: '${controller.jobDetailsResponse!.data!.fullAddress}',
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
