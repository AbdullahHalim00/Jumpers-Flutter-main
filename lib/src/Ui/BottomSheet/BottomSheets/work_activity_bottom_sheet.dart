import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Bloc/controllers/fetch_work_activity_controller.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/request_status.dart';
import 'package:jumper/src/Core/utils/extensions.dart';
import 'package:jumper/src/Ui/BottomSheet/widgets/single_choice_row_form.dart';
import 'package:jumper/src/Ui/buttons/custom_text_button.dart';
import 'package:jumper/src/Ui/circle_avatar/custom_icon_avatar.dart';
import 'package:jumper/src/Ui/spaces_and_dividers/custom_divider.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

class WorkActivityBottomSheet extends StatelessWidget {
  final Function(int, String) onSave;

  const WorkActivityBottomSheet({
    required this.onSave,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FetchWorkActivityController>(
      builder: (_) {
        // var item = _.dataState!.data!;
        return Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconAvatar(
                    imageUrl: Assets.close,
                    onTap: () => Get.back(),
                  ),
                  CustomText(
                    '',
                    fontWeight: FW.semiBold,
                    padding: EdgeInsetsDirectional.only(end: 20.w, start: 30.w),
                  ),
                  CustomTextButton(
                    onPressed: () {
                      onSave(
                        _.workActivityID,
                        _.workActivityTitle,
                      );
                      Get.back();
                    },
                    child: CustomText(
                      "done".tr,
                      fontSize: 16,
                      fontWeight: FW.semiBold,
                      color: AppColors.primary,
                    ),
                  )
                ],
              ),
            ),
            XDivider.normal(verticalPadding: 5.0.h),
            DataStatusBuilder(
              status: _.dataState!,
              onDoneBuild: _.dataState is DataSuccess
                  ? Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              if (_.workActivityID ==
                                  _.dataState!.data![index].id) {
                                _.setWorkActivityID(0);
                                _.setWorkActivityTitle('');
                              } else {
                                _.setWorkActivityID(
                                    _.dataState!.data![index].id);
                                _.setWorkActivityTitle(
                                    _.dataState!.data![index].title);
                              }
                            },
                            child: SingleChoiceRowForm(
                              title: _.dataState!.data![index].title,
                              isSelected: _.workActivityID ==
                                  _.dataState!.data![index].id,
                            ),
                          );
                        },
                        itemCount: _.dataState!.data!.length,
                      ),
                    )
                  : 0.ESH(),
            ),
          ],
        );
      },
    );
  }
}
