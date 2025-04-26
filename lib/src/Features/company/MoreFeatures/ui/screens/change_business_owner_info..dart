import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Bloc/controllers/fetch_identities_controller.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CompanyInformation/Logic/organisation_info_controller.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CompanyInformation/Presentation/Widget/avatar_widget.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CompanyInformation/Presentation/Widget/business_owner_info_widget.dart';
import 'package:jumper/src/Ui/appbars/default_appbar.dart';

class ChangeBusinessOwnerIfo extends StatelessWidget {
  const ChangeBusinessOwnerIfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FetchIdentitiesController());
    return Scaffold(
      appBar: AppBars.basic(
        title: 'basic_data',
        isBack: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: GetBuilder<OrganisationController>(
            init: OrganisationController(isBusinessOwnerEdit: true),
            builder: (_) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    AvatarWidget(
                      futureImage: _.futureImage,
                      defaultImage: "assets/icons/avatarOrganizationIcon.png",
                      onTap: (val) {
                        _.setAvatar(val);
                      },
                    ),
                    32.ESH(),
                    BusinessOwnerIfoWidget(
                      controller: _,
                      onTap: () {
                        _.editOrganisationInfo(2);
                      },
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
