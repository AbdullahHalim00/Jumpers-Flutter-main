import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Bloc/controllers/fetch_cities_controller.dart';
import 'package:jumper/src/Core/constants/decorations/app_physics.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Features/shared/AuthFeature/CompanyInformation/Presentation/Widget/avatar_widget.dart';
import 'package:jumper/src/Features/shared/AuthFeature/JumperInformation/Logic/jumper_personal_info_controller.dart';
import 'package:jumper/src/Features/shared/AuthFeature/JumperInformation/presentation/Widget/gender_type_widget.dart';
import 'package:jumper/src/Features/shared/AuthFeature/JumperInformation/presentation/Widget/jumper_info_field.dart';
import 'package:jumper/src/Features/shared/AuthFeature/JumperInformation/presentation/Widget/nationality_type_widget.dart';
import 'package:jumper/src/Ui/appbars/default_appbar.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

class JumperInfoScreen extends StatelessWidget {
  final bool isEdit;

  const JumperInfoScreen({this.isEdit = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FetchCitiesController());
    Get.put(JumperPersonalInfoController(isEdit: isEdit));
    return GetBuilder<JumperPersonalInfoController>(
      builder: (_) => Scaffold(
          appBar: AppBars.basic(
            title: 'profile',
            isBack: isEdit,
            actions: [
              isEdit
                  ? 0.ESW()
                  : Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.w),
                        child: const CustomText("1/3"),
                      ),
                    ),
            ],
          ),
          body: CustomScrollView(
            physics: AppPhysics.alwaysScrollablePhysics,
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AvatarWidget(
                        defaultImage: "assets/icons/avatarOrganizationIcon.png",
                        onTap: (val) {
                          _.setAvatar(val);
                        },
                        futureImage: _.futureImage,
                      ),
                      16.ESH(),
                      CustomText.light('add_avatar')
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: GenderTypeWidget(controller: _),
              ),
              SliverToBoxAdapter(
                child: NationalityTypeWidget(controller: _),
              ),
              SliverToBoxAdapter(
                child: JumperInfoField(controller: _),
              ),
            ],
          )),
    );
  }
}
