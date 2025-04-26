part of 'imports_widgets_employee_details.dart';

class EmployeeDetailsHeader extends StatelessWidget {
  final EmployeeModel employee;
  bool inFav = false;

  EmployeeDetailsHeader({
    Key? key,
    required this.employee,
    required this.inFav
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConditionalBuilder(
          condition: employee.image != "",
          onBuild: CircleAvatar(
            radius: 30.r,
            backgroundColor: AppColors.circleAvatarDarker,
            backgroundImage: NetworkImage(employee.image),
          ),
          onFeedBack: CircleAvatar(
            radius: 30.r,
            backgroundColor: AppColors.circleAvatarDarker,
            backgroundImage: const AssetImage(Assets.defaultUser),
          ),
        ),
        XSpace.hard,
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                employee.name,
                fontWeight: FW.semiBold,
                fontSize: 14,
              ),
              CustomText(
                employee.service,
                fontSize: 11,
              ),
              CustomText.subtitle(
                "work".tr +
                    ": " +
                    " ${employee.startWorkTime}" +
                    "-" +
                    employee.endWorkTime,
                fontSize: 11,
              ),
              Row(
                children: [
                  CustomText.subtitle(
                    "work_type".tr + ": " + " ${employee.workType} ",
                    fontSize: 11,
                  ),
                  // CustomTextButton(
                  //   onPressed: () {
                  //     AppSheet.showDefaultSheet(
                  //       BuildWorkDaysSheet(
                  //         employee: employee,
                  //       ),
                  //     );
                  //   },
                  //   child: CustomText.subtitle(
                  //     "show_days".tr,
                  //     padding: const EdgeInsets.only(bottom: 5),
                  //     color: AppColors.secondary,
                  //     decoration: CustomTextDecoration.underLine,
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: AppColors.mainOverlay,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: CustomText.subtitle("from".tr +
              ": " +
              (employee.activityDate != "" ? employee.activityDate : "-")),
        ),
      ],
    );
  }
}
