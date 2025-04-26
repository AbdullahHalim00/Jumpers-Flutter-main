import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../JumperHomeFeature/bloc/controller/jumper_jobs_controller.dart';

class JobActivityWidget extends StatelessWidget {
  int? index2;
  int? index1;

  JobActivityWidget({this.index2, this.index1});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<JumperJobsController>(builder: (controller) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: .7, color: Colors.grey.withOpacity(.6))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 14,
            ),
            Image.asset(
              'assets/icons/clock.png',
              width: 45,
              height: 45,
            ),
            SizedBox(
              width: 14,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${controller.jobActivityResponse!.data![index1!].activity![index2!].type}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  '${controller.jobActivityResponse!.data![index1!].activity![index2!].time}',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                )
              ],
            )
          ],
        ),
      );
    });
  }
}
