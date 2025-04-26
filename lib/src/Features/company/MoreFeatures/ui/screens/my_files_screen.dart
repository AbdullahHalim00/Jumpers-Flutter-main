import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';

import '../../../../../Core/services/network/request_status.dart';
import '../../../../../Ui/loading/loading_box.dart';
import '../../../../shared/ContactUsScreen/bloc/controller/contact_us_controller.dart';
import '../../../../shared/ContactUsScreen/ui/widgets/contact_us_scaffold.dart';

class MyFilesScreen extends StatelessWidget {
  const MyFilesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);
    return MyFileScaffold(
      body: GetBuilder<ContactUsController>(
        init: ContactUsController(),
        builder: (_) {
          print(_.contractDataState.data![0].textAr);
          return DataStatusBuilder(
            status: _.contractDataState,
            onLoadingBuild: const LoadingBox(),
            onDoneBuild: _.contractDataState.data == null
                ? const LoadingBox()
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25.h,
                        ),
                        _.contractDataState.data!.isNotEmpty
                            ? Container(
                                margin: EdgeInsets.symmetric(horizontal: 16.w),
                                child: ListView.builder(
                                  reverse: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (cnx, index) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "contract_data".tr,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14.sp),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Text(
                                            "${_.contractDataState.data![index].contractDate}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.sp),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Text(
                                        "first_contract".tr,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14.sp),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "name".tr,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 13.sp),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Text(
                                            _.contractDataState.data![index]
                                                    .firstPart!.name ??
                                                "",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.sp),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "email".tr,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 13.sp),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Text(
                                            _.contractDataState.data![index]
                                                    .firstPart!.email ??
                                                "",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.sp),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "phone_number".tr,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 13.sp),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Text(
                                            _.contractDataState.data![index]
                                                    .firstPart!.phone ??
                                                "",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.sp),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Text(
                                        "second_contract".tr,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14.sp),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "name".tr,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 13.sp),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Text(
                                            _.contractDataState.data![index]
                                                    .secondPart!.name ??
                                                "",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.sp),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "email".tr,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 13.sp),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Text(
                                            _.contractDataState.data![index]
                                                    .secondPart!.email ??
                                                "",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.sp),
                                          ),
                                        ],
                                      ),
                                      Row(children: [
                                        Text(
                                          "phone_number".tr,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 13.sp),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text(
                                          _.contractDataState.data![index]
                                                  .secondPart!.phone ??
                                              "",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13.sp),
                                        ),
                                      ]),
                                      Row(
                                        children: [
                                          Text(
                                            "ordered_service".tr,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 13.sp),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Text(
                                            _.contractDataState.data![index]
                                                    .title ??
                                                "",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.sp),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "price".tr,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 13.sp),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Text(
                                            _.contractDataState.data![index]
                                                    .price ??
                                                "",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.sp),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Text(
                                        "contract_conditions".tr,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14.sp),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: Html(
                                            data: _.contractDataState.data![index]
                                                .textAr ?? '',
                                            customTextAlign: (_)=> TextAlign.end // to make dir is ltr
                                          ),
                                      ),
                                      SizedBox(
                                        height: 30.h,
                                      ),
                                      Visibility(
                                          visible: index !=
                                              _.contractDataState.data!.length -
                                                  1,
                                          child: Divider(
                                            thickness: 2.h,
                                            height: 2.h,
                                            color: Colors.black,
                                          )),
                                      SizedBox(
                                        height: 30.h,
                                      ),
                                    ],
                                  ),
                                  itemCount: _.contractDataState.data!.length,
                                ))
                            : Center(
                                child: Image.asset(
                                  Assets.empty_job_applications,
                                  width: 250.w,
                                  height: 250.h,
                                ),
                              ),
                        Visibility(
                          visible: _.contractDataState.data!.isEmpty,
                          child: Center(
                            child: Text(
                              "no_contract_availabe_now".tr,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
