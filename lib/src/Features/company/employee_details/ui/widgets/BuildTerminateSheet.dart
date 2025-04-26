part of "imports_widgets_employee_details.dart";

class BuildTerminateSheet extends StatelessWidget {
  final int employeeId;

  const BuildTerminateSheet({Key? key, required this.employeeId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FinishEmployeeWorkController());
    Get.put(FetchRefusingReasonsController());
    return GetBuilder<FinishEmployeeWorkController>(builder: (_) {
      return SheetHeader(
        title: "terminate_work".tr,
        sheetBody: Padding(
          padding: AppInsets.defaultScreenALL,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: AppPhysics.alwaysScrollablePhysics,
                  child: Form(
                    key: _.formKey,
                    child: Column(
                      children: [
                        TextFieldDefault(
                          isRequired: true,
                          readOnly: true,
                          hint: "cause".tr,
                          hintColor: AppColors.greyPrimary,
                          controller: _.causeController,
                          suffixIconData: Icons.keyboard_arrow_down,
                          validation: AppValidator.validate,
                          onTap: _.onCauseTapped,
                        ),
                        YSpace.titan,
                        TextFieldDefault(
                          maxLines: 3,
                          hint: "cause_description".tr,
                          hintColor: AppColors.greyPrimary,
                          controller: _.descriptionController,
                        ),
                        YSpace.titan,
                      ],
                    ),
                  ),
                ),
              ),
              BottomRequestStatusBuilder(
                status: _.dataState,
                bottomWidget: CustomRoundedButton(
                  backgroundColor: AppColors.secondary,
                  isDisabled: _.isButtonDisabled,
                  child: CustomText(
                    "save".tr,
                    color: AppColors.white,
                  ),
                  // isDisabled: _.isProceedButtonDisabled,
                  onPressed: () {
                    if (_.formKey.currentState!.validate()) {
                      _.finishEmployee(employeeId);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
