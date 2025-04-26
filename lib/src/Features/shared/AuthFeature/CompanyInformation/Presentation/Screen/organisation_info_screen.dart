import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Bloc/controllers/admin_adjective_controller.dart';
import 'package:jumper/src/Bloc/controllers/fetch_cities_controller.dart';
import 'package:jumper/src/Bloc/controllers/fetch_identities_controller.dart';
import 'package:jumper/src/Bloc/controllers/fetch_sectors_controller.dart';
import 'package:jumper/src/Bloc/controllers/fetch_work_activity_controller.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CompanyInformation/Logic/organisation_info_controller.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CompanyInformation/Presentation/Widget/admin_info_widget.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CompanyInformation/Presentation/Widget/avatar_widget.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CompanyInformation/Presentation/Widget/business_owner_info_widget.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CompanyInformation/Presentation/Widget/company_info_widget.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CompanyInformation/Presentation/Widget/organisation_type.dart';
import 'package:jumper/src/Ui/appbars/default_appbar.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

class OrganisationInfoScreen extends StatelessWidget {
  const OrganisationInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AdminAdjectiveController());
    Get.put(FetchWorkActivityController());
    Get.put(FetchSectorsController());
    Get.put(FetchCitiesController());
    Get.put(FetchIdentitiesController());
    Get.put(OrganisationController());
    return GetBuilder<OrganisationController>(
      builder: (_) => Scaffold(
        appBar: AppBars.basic(
          title: 'organisation_info',
          actions: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: CustomText(
                    "${_.currentPageViewIndex + 1}/${_.organisationTypeId == 0 ? 2 : 1}"),
              ),
            ),
          ],
          leading: _.currentPageViewIndex == 0
              ? 0.ESH()
              : IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    _.onLastPage();
                  },
                ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                pinned: false,
                expandedHeight: 210.h,
                leading: 0.ESW(),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AvatarWidget(
                          futureImage: _.futureImage,
                          defaultImage:
                              "assets/icons/avatarOrganizationIcon.png",
                          onTap: (val) {
                            _.setAvatar(val);
                          },
                        ),
                        16.ESH(),
                        CustomText.light('organization_or_company_image'),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: _.currentPageViewIndex == 0
                    ? OrganisationType(controller: _)
                    : 0.ESW(),
              ),
            ];
          },
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: PageView.builder(
              // physics: const NeverScrollableScrollPhysics(),
              controller: _.pageController,
              itemCount: _.organisationTypeId == 0 ? 2 : 1,
              onPageChanged: (index) => _.onPageChanged(index),
              itemBuilder: (ctx, index) {
                // _.updatePageIndex(index);
                return index == 0
                    ? _.organisationTypeId == 0
                        ? CompanyIfoWidget(
                            controller: _,
                            onTap: () {
                              _.moveToSecondPage();
                            })
                        : BusinessOwnerIfoWidget(
                            controller: _,
                            onTap: () {
                              // _.moveToSecondPage();
                              _.register(2);
                            })
                    : AdminIfoWidget(
                        controller: _,
                        onTap: () {
                          _.register(1);
                        });
              },
            ),
          ),
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
        ),
        // CustomScrollView(
        //   slivers: <Widget>[
        //      SliverAppBar(
        //       pinned: false,
        //       expandedHeight: 180.h,
        //       flexibleSpace: FlexibleSpaceBar(
        //         centerTitle: true,
        //         background: Center(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: [
        //               AvatarWidget(
        //                 defaultImage:
        //                 "assets/icons/avatarOrganizationIcon.png",
        //                 onTap: (val) {},
        //                 futureImage: '',
        //               ),
        //               16.ESH(),
        //               CustomText.light('organization_or_company_image')
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //     SliverToBoxAdapter(
        //       child: _.currentPageViewIndex == 0 ? OrganisationType(controller: _) : 0.ESW(),
        //     ),
        //     SliverToBoxAdapter(
        //       child: PageView.builder(
        //         // physics: const NeverScrollableScrollPhysics(),
        //         controller: _.pageController,
        //         itemCount: 2,
        //         onPageChanged: (index) => _.onPageChanged(index),
        //         itemBuilder: (ctx, index) {
        //           // _.updatePageIndex(index);
        //           return index == 0
        //               ? _.organisationTypeId == 0
        //               ? CompanyIfoWidget(controller: _)
        //               : BusinessOwnerIfoWidget(controller: _)
        //               : AdminIfoWidget(controller: _);
        //         },
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
