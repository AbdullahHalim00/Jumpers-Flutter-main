import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Ui/buttons/custom_text_button.dart';

import '../../../../../Core/constants/colors/app_colors.dart';
import '../../bloc/controller/job_employees_controller.dart';

class PayDialog extends StatelessWidget {
  JobEmployeesController? controller;
  int? job_id;
  BuildContext cnx;

  PayDialog(
    this.cnx, {
    this.controller,
    this.job_id,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 15.h,
            ),
            Row(),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.secondary.withOpacity(.1),
                  border: Border.all(color: AppColors.secondary, width: .8.w)),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Icon(
                  Icons.info_outline,
                  color: AppColors.secondary,
                  size: 22,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Text(
                    'في حال غياب او تأخر الموظف , سيتم استرداد المبلغ عن طريق تواصلكم مع الدعم',
                    style: TextStyle(
                      fontSize: 11.sp,
                    ),
                    textAlign: TextAlign.start,
                  ),
                )
              ]),
            ),
            SizedBox(
              height: 15.h,
            ),
            InkWell(
              onTap: () async {
                Navigator.pop(context);
                await Future.delayed(Duration(seconds: 1));
                controller!.payment(job_id.toString(), cnx);
              },
              child: CustomTextButton(
                child: Text(
                  "pay_now".tr,
                  style: TextStyle(color: Colors.white),
                ),
                isCurvedBorders: true,
                backgroundColor: AppColors.secondary,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
          ],
        ),
      ),
    );
  }
}
