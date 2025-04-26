part of 'imports_widget_create_new_application.dart';

class BuildLowCostCautionDialog extends StatelessWidget {
  const BuildLowCostCautionDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          Assets.low_cost,
          height: 142.h,
          width: 171.w,
        ),
        33.0.ESH(),
        CustomText(
          "minimum_cost_caution".tr,
          fontSize: 16,
          isBold: true,
        ),
        14.0.ESH(),
        CustomText(
          "minimum_cost_caution_detailed".tr,
          fontSize: 12,
          fontWeight: FW.regular,
        ),
        33.0.ESH(),
        CustomRoundedButton(
          backgroundColor: AppColors.secondary,
          onPressed: () {
            Navigator.pop(context);
          },
          child: CustomText(
            "i_understand".tr,
            fontSize: 13,
            color: AppColors.white,
            fontWeight: FW.medium,
          ),
        ),
      ],
    );
  }
}
