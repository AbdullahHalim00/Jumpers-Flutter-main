part of 'IMPORTS_widgets_employee_screen.dart';

class EmptyAllEmployeeBuilder extends StatelessWidget {
  const EmptyAllEmployeeBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyPageBuilder(
      title: "employee_empty_title".tr,
      body: "employee_empty_details".tr,
      imageUrl: Assets.emptyEmployees,
    );
  }
}
