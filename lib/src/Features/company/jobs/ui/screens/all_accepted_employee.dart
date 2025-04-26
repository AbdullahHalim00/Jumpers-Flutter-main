import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Features/company/jobs/ui/screens/company_job_details_screen.dart';

import '../../../../../Bloc/models/company_job_model.dart';
import '../../../../../Core/constants/colors/app_colors.dart';
import '../../../../../Core/constants/strings/assets.dart';
import '../../../../../Core/resources/data_state.dart';
import '../../../../../Core/services/network/request_status.dart';
import '../../../../../Ui/builders/conditional_builder.dart';
import '../../../../../Ui/loading/loading_box.dart';
import '../../../../../Ui/spaces_and_dividers/spaces.dart';
import '../../../../../Ui/text/custom_text.dart';
import '../../../job_details/bloc/controller/job_employees_controller.dart';
import '../../../job_details/ui/widgets/imports_widgets_job_details_screen.dart';

class AllAcceptedEmployee extends StatelessWidget {
  final CompanyJobModel? job;

  AllAcceptedEmployee({this.job});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<JobEmployeesController>(
        init: JobEmployeesController(jobId: job!.id),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "employees".tr,
                style: TextStyle(fontFamily: "Somar"),
              ),
            ),
            body: DataStatusBuilder(
              status: _.dataState,
              onDoneBuild: _.dataState is DataSuccess
                  ? ConditionalBuilder(
                      condition:
                          (_.dataState.data!.worked_employees.isNotEmpty),
                      // if list not empty
                      onBuild: SingleChildScrollView(
                        child: Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (cnx, index) => InkWell(
                                onTap: () {
                                  Get.to(CompanyJobDetailsScreen(
                                      job_id: job!.id,
                                      employee_id: _.dataState.data!
                                          .worked_employees[index].id,
                                      job: job));
                                },
                                child: Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ConditionalBuilder(
                                            condition: _
                                                    .dataState
                                                    .data!
                                                    .worked_employees[index]
                                                    .image !=
                                                "",
                                            onBuild: CircleAvatar(
                                              // radius: ,
                                              backgroundColor:
                                                  AppColors.circleAvatarDarker,
                                              backgroundImage: NetworkImage(
                                                  "${_.dataState.data!.worked_employees[index].image}"),
                                            ),
                                            onFeedBack: const CircleAvatar(
                                              // radius: ,
                                              backgroundColor:
                                                  AppColors.circleAvatarDarker,
                                              backgroundImage: AssetImage(
                                                  Assets.defaultUser),
                                            ),
                                          ),
                                          XSpace.normal,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 170,
                                                child: CustomText(
                                                  _
                                                      .dataState
                                                      .data!
                                                      .worked_employees[index]
                                                      .name,
                                                  fontWeight: FW.semiBold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              9.0.ESH(),
                                              CustomText.subtitle(
                                                (_
                                                        .dataState
                                                        .data!
                                                        .worked_employees[index]
                                                        .nationality) +
                                                    " " +
                                                    (_
                                                        .dataState
                                                        .data!
                                                        .worked_employees[index]
                                                        .gender) +
                                                    " " +
                                                    (_
                                                        .dataState
                                                        .data!
                                                        .worked_employees[index]
                                                        .age
                                                        .toString()),
                                                fontSize: 11,
                                              ),
                                              25.0.ESH(),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        thickness: .7,
                                        height: .7,
                                        color: Colors.grey.withOpacity(.5),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              itemCount:
                                  _.dataState.data!.worked_employees.length,
                            )
                          ],
                        ),
                      ),
                      onFeedBack: const SingleChildScrollView(
                        child: Center(child: EmptyCandidateBuilder()),
                      ),
                    )
                  : 0.0.ESH(),
              onLoadingBuild: Center(child: const LoadingBox()),
            ),
          );
        });
  }
}
