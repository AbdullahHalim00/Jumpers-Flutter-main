part of 'IMPORTS_search_employee.dart';

class SearchEmployeeBodyBuilder extends StatelessWidget {
  final List<EmployeeModel> data;

  final String searchedLetter;

  const SearchEmployeeBodyBuilder({
    Key? key,
    required this.data,
    required this.searchedLetter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: [
        GetBuilder<MyEmployeesController>(builder: (_) {
          return AnimatedWrapper(
            index: data.length,
            durationStyle: WrapDurationStyle.veryFast,
            child: ListView.builder(
              physics: AppPhysics.neverScrollable,
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                final employee = data[index];
                return EmployeeCard(
                  employee: employee,
                  isActivityDone: true,
                  searchedLetter: searchedLetter,
                );
              },
            ),
          );
        }),
      ],
    );
  }
}
