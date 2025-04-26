part of 'imports_widgets_employee_details.dart';

class BuildExtendPeriodSuccessDialog extends StatelessWidget {
  const BuildExtendPeriodSuccessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            Assets.period_extend,
            height: 84.h,
            width: 84.w,
            fit: BoxFit.cover,
          ),
          YSpace.titan,
          CustomText(
            "extend_period_successfully".tr,
          ),
        ],
      ),
    );
  }
}
