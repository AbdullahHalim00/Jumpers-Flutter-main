part of 'IMPORTS_search_jobtile_employee.dart';

class EmptySearchJobTileBuilder extends StatelessWidget {
  const EmptySearchJobTileBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyPageBuilder(
      title: "empty_job_tile".tr,
      imageUrl: Assets.emptySearchEmployees,
    );
  }
}
