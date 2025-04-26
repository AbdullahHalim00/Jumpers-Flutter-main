part of 'imports_widgets_manage_work.dart';

class BuildRequestDayOffSheet extends StatelessWidget {
  const BuildRequestDayOffSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppInsets.defaultScreenALL,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: AppPhysics.alwaysScrollablePhysics,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 24.0.h, top: 17.h),
                    child: TextFieldDefault(
                      hint: "cause".tr,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 24.0.h,
                    ),
                    child: TextFieldDefault(
                      hint: "description".tr + "(${"optional".tr})",
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomRoundedButton(
            backgroundColor: AppColors.secondary,
            child: CustomText(
              "request_details".tr,
              fontSize: 13,
              color: AppColors.white,
            ),
            isDisabled: false,
            onPressed: () {},
            height: 54.h,
          ),
        ],
      ),
    );
  }
}
