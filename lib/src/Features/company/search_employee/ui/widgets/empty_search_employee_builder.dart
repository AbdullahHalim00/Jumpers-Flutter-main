part of 'IMPORTS_search_employee.dart';

class EmptySearchEmployeeBuilder extends StatelessWidget {
  const EmptySearchEmployeeBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyPageBuilder(
      title: "employee_empty_details".tr,
      imageUrl: Assets.emptySearchEmployees,
    );
  }
}
