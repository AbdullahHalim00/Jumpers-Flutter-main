import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';

import '../../../../../Core/services/network/request_status.dart';
import '../../../../../Ui/buttons/button_default.dart';
import '../../bloc/controller/accept_employee_controller.dart';

class RateBookingScreen extends StatelessWidget {
  int? jobID;
  int? employeeID;

  RateBookingScreen({this.jobID, this.employeeID});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<AcceptEmployeeController>(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: AppBar(
            elevation: .3,
            backgroundColor: Colors.white,
            title: Container(
              margin: EdgeInsets.only(top: 15.h),
              child: Text(
                'Rate Employee'.tr,
                style: TextStyle(fontSize: 16.sp, color: AppColors.basicColor),
              ),
            ),
            centerTitle: true,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 15.h),
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 18.sp,
                  color: AppColors.basicColor,
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 24.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    Center(
                      child: Text(
                        'Rate your Experience',
                        style: TextStyle(
                            fontSize: 16.sp, color: AppColors.basicColor),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Center(
                      child: RatingBar(
                        unratedColor: Colors.white,
                        initialRating: 1,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 8.0),
                        ratingWidget: RatingWidget(
                          full: Image.asset(
                            'assets/images/rate_full.png',
                            width: 55.w,
                            height: 55.h,
                          ),
                          half: Image.asset(
                            'assets/images/rate_full.png',
                            width: 55.w,
                            height: 55.h,
                          ),
                          empty: Image.asset(
                            'assets/images/rate_empty.png',
                            width: 28.w,
                            height: 28.h,
                          ),
                        ),
                        onRatingUpdate: (rating) {
                          _.rateReview = rating;
                          _.update();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Center(
                child: BottomRequestStatusBuilder(
                  status: _.rateDataState,
                  bottomWidget: ButtonDefault(
                    title: 'send'.tr,
                    onTap: () {
                      _.rateEmployee(jobID!, employeeID!);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
