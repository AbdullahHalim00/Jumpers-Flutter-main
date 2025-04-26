import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Bloc/controllers/admin_adjective_controller.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CompanyInformation/Logic/organisation_info_controller.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CompanyInformation/Presentation/Widget/admin_info_widget.dart';
import 'package:jumper/src/Ui/appbars/default_appbar.dart';

class ChangeAdminInfo extends StatelessWidget {
  const ChangeAdminInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AdminAdjectiveController());
    return Scaffold(
      appBar: AppBars.basic(
        title: 'basic_data',
        isBack: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: GetBuilder<OrganisationController>(
            init: OrganisationController(isAdminEdit: true),
            builder: (_) {
              return AdminIfoWidget(
                controller: _,
                onTap: () {
                  _.editOrganisationInfo(1);
                },
              );
            }),
      ),
    );
  }
}
