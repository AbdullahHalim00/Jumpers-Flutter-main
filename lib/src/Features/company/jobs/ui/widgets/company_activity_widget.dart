import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Features/company/jobs/bloc/controller/company_activity_emplyee_controller.dart';

class CompanyActivityWidget extends StatelessWidget {
  int? index2;
  int? index1;

  CompanyActivityWidget({this.index2, this.index1});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<CompanyActivityEmployeeController>(builder: (controller) {
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
                  '${controller.employeeActivityResponse!.data!.attendanceHistory![index1!].attendance![index2!].isAttendees == "1" ? "attendance_record".tr : "absence_record".tr}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  '${controller.employeeActivityResponse!.data!.attendanceHistory![index1!].attendance![index2!].createdAt}',
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
