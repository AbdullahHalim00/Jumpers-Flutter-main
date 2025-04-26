import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Ui/loading/loading_box.dart';
import '../../JumperHomeFeature/bloc/controller/jumper_jobs_controller.dart';
import '../widgets/job_activity_widget.dart';

class JobActivityScreen extends StatelessWidget {
  int? id;

  JobActivityScreen({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<JumperJobsController>(builder: (controller) {
      return Scaffold(
        body: controller.jobActivityResponse == null
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
                                '${controller.jobActivityResponse!.data![index].date}',
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 16),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (_, i) => JobActivityWidget(
                                  index2: i,
                                  index1: index,
                                ),
                                itemCount: controller.jobActivityResponse!
                                    .data![index].activity!.length,
                              )
                            ],
                          ),
                        ),
                        itemCount: controller.jobActivityResponse!.data!.length,
                      ),
                    ],
                  ),
                ),
              ),
      );
    });
  }
}
