part of 'imports_widgets_employee_details.dart';

class BuildTerminationDialog extends StatelessWidget {
  final int employeeId;

  const BuildTerminationDialog({
    Key? key,
    required this.employeeId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmployeeDetailsController>(builder: (_) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            Assets.terminate,
            height: 80.h,
            fit: BoxFit.cover,
          ),
          YSpace.titan,
          CustomText.header(
            "employee_termination_message".tr,
            fontSize: 12,
          ),
          YSpace.titan,
          Row(
            children: [
              Expanded(
                child: ButtonDefault(
                  title: "termination_confirmation".tr,
                  onTap: () {
                    Get.back();
                    AppSheet.showDefaultSheet(
                      BuildTerminateSheet(
                        employeeId: employeeId,
                      ),
                    );
                    // Utils.showDefaultSnackBar(
                    //   title: "هذا الموظف لم يعد متاح لهذه الوظيفة ",state: UtilState.None
                    // );
                  },
                ),
              ),
              XSpace.hard,
              Expanded(
                child: ButtonDefault(
                  buttonColor: AppColors.white,
                  title: "back".tr,
                  titleColor: AppColors.black,
                  borderColor: AppColors.greyDarker,
                  onTap: () {
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
