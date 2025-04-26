part of 'IMPORTS_widgets_employee_screen.dart';

class EmptyFavEmployeeBuilder extends StatelessWidget {
  const EmptyFavEmployeeBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyPageBuilder(
      title: "employee_fav_empty_title".tr,
      body: "employee_fav_empty_details".tr,
      imageUrl: Assets.emptyFavEmployees,
    );
  }
}
