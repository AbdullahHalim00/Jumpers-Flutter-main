part of 'IMPORTS_widgets_employee_screen.dart';

class FavEmployeeCardBuilder extends StatelessWidget {
  final List<EmployeeModel> employees;

  const FavEmployeeCardBuilder({Key? key, required this.employees})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyEmployeesController>(builder: (_) {
      return AnimatedWrapper(
        index: employees.length,
        durationStyle: WrapDurationStyle.veryFast,
        child: ListView.builder(
          physics: AppPhysics.neverScrollable,
          shrinkWrap: true,
          itemCount: employees.length,
          itemBuilder: (context, index) {
            final employee = employees[index];
            return EmployeeCard(
              employee: employee,
              isActivityDone: false,
              inFav: true,
            );
          },
        ),
      );
    });
  }
}
