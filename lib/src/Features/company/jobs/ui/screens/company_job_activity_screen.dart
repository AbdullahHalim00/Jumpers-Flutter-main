import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Ui/loading/loading_box.dart';
import '../../bloc/controller/company_activity_emplyee_controller.dart';
import '../widgets/company_activity_widget.dart';

class CompanyJobActivityScreen extends StatelessWidget {
  const CompanyJobActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<CompanyActivityEmployeeController>(builder: (controller) {
      return Scaffold(
        body: controller.employeeActivityResponse == null
            ? const LoadingBox()
            : SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) => Container(
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${controller.employeeActivityResponse!.data!.attendanceHistory![index].date}',
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 16),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (_, i) => CompanyActivityWidget(
                                  index2: i,
                                  index1: index,
                                ),
                                itemCount: controller
                                    .employeeActivityResponse!
                                    .data!
                                    .attendanceHistory![index]
                                    .attendance!
                                    .length,
                              )
                            ],
                          ),
                        ),
                        itemCount: controller.employeeActivityResponse!.data!
                            .attendanceHistory!.length,
                      ),
                    ],
                  ),
                ),
              ),
      );
    });
  }
}
