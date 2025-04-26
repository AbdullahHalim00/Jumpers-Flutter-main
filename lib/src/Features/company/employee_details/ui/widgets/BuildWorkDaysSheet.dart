part of 'imports_widgets_employee_details.dart';

class BuildWorkDaysSheet extends StatelessWidget {
  final EmployeeModel employee;

  const BuildWorkDaysSheet({
    Key? key,
    required this.employee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SheetHeader(
      sheetBody: Padding(
        padding: AppInsets.defaultScreenALL,
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  DottedInfoTile(
                    label: "work_type".tr,
                    data:
                        (employee.workType != "" ? employee.workType : "-"), //
                  ),
                  if (employee.startWorkTime != "" &&
                      employee.endWorkTime != "")
                    DottedInfoTile(
                      label: "work_period".tr,
                      data: "${employee.startWorkTime.adN}"
                          " - "
                          "${employee.endWorkTime.adN}", //
                    ),
                  25.0.ESH(),
                  Container(
                    color: AppColors.greyOverlay,
                    padding: EdgeInsets.all(14.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomText.header(
                          "work_days".tr,
                          fontWeight: FW.regular,
                        ),
                        Wrap(
                          children: employee.days
                              .map(
                                (e) => DottedInfoTile(
                                  label: e,
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                  50.0.ESH(),
                ],
              ),
            ),
            ButtonDefault(
              title: "ok".tr,
              onTap: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
      title: "work_days",
    );
  }
}
