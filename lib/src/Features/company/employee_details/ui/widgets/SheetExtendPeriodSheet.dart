part of "imports_widgets_employee_details.dart";

class SheetExtendPeriod extends StatelessWidget {
  final int? employeeId;

  const SheetExtendPeriod({
    Key? key,
    this.employeeId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmployeeTermExtensionController>(
        init: EmployeeTermExtensionController(),
        builder: (_) {
          return SheetHeader(
            title: "extend_period".tr,
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
                            ...[
                              // _.workTimeTypeID == 1
                              //     ? Column(
                              //   children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFieldDefault(
                                      isRequired: true,
                                      readOnly: true,
                                      hint: "start_date".tr,
                                      hintColor: AppColors.greyPrimary,
                                      controller: _.startDateController,
                                      validation: AppValidator.validate,
                                      onTap: () => _.pickStartDate(),
                                    ),
                                  ),
                                  XSpace.titan,
                                  Expanded(
                                    child: TextFieldDefault(
                                      isRequired: true,
                                      readOnly: true,
                                      hint: "end_date".tr,
                                      hintColor: AppColors.greyPrimary,
                                      controller: _.endDateController,
                                      validation: AppValidator.validate,
                                      onTap: () => _.pickEndDate(),
                                    ),
                                  ),
                                ],
                              ),

                              YSpace.titan,
                              TextFieldDefault(
                                hint: "insert_period".tr,
                                controller: _.periodController,
                                isRequired: true,
                                enable: false,
                                validation: AppValidator.validate,
                              ),
                              YSpace.titan,
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                  BottomRequestStatusBuilder(
                    status: _.dataState,
                    bottomWidget: CustomRoundedButton(
                      height: 54.h,
                      backgroundColor: AppColors.secondary,
                      child: CustomText(
                        "save".tr,
                        color: AppColors.white,
                      ),
                      isDisabled: _.isButtonDisabled,
                      onPressed: () {
                        if (_.formKey.currentState!.validate()) {
                          _.extendPeriod(employeeId: employeeId!);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            // onSavePress: (){
            //   if (_.formKey.currentState!.validate()) {
            //     _.extendPeriod(employeeId: employeeId!);
            //   }
            // },
          );
        });
  }
}
